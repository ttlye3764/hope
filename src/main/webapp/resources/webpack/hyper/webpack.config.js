const path = require('path');
const webpack = require('webpack');
const HtmlWebPackPlugin = require('html-webpack-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssUrlRelativePlugin = require('css-url-relative-plugin');
const FixStyleOnlyEntriesPlugin = require('webpack-fix-style-only-entries');
const autoprefixer = require('autoprefixer');

// optimization
const MomentLocalesPlugin = require('moment-locales-webpack-plugin');
const CompressionPlugin = require('compression-webpack-plugin');

const HyperConfig = require('./pages.config.js');

const IS_DEV = process.env.NODE_ENV === 'dev';

const config = {
  mode: IS_DEV ? 'development' : 'production',
  devtool: IS_DEV ? 'eval' : 'source-map',
  entry: HyperConfig.entries,
  output: {
    filename: 'js/[name].[hash].js',
    path: path.resolve(__dirname, 'dist'),
  },
  performance: {
    maxEntrypointSize: 1024000,
    maxAssetSize: 1024000,
    hints: false,
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          {
            loader: 'postcss-loader',
            options: { plugins: () => [autoprefixer()] },
          },
          'sass-loader',
        ],
      },
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader'],
        // loaders: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(gif|png|jpe?g|svg)$/i,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8192,
              name: '[name].[ext]',
              fallback: 'file-loader',
              outputPath: 'public/images',
            },
          },
          {
            loader: 'image-webpack-loader',
            options: {
              mozjpeg: {
                mozjpeg: {
                  progressive: true,
                  quality: 65,
                },
                pngquant: {
                  quality: '65-90',
                  speed: 4,
                },
                gifsicle: {
                  interlaced: false,
                },
                webp: {
                  quality: 75,
                },
              },
            },
          },
        ],
      },
      {
        test: /\.html$/,
        include: path.join(__dirname, 'src'),
        use: [
          {
            loader: 'html-loader?interpolate',
            options: {
              attrs: [':data-src'],
              minimize: true,
              interpolate: true,
            },
          },
        ],
      },
      {
        test: /\.(svg|eot|ttf|woff|woff2)$/,
        loader: 'url-loader',
        options: {
          limit: 4096,
          name: './public/fonts/[name].[ext]?[hash]', // was '/fonts/[name].[ext]?[hash]',
          outputPath: 'public/fonts/',
        },
      },
    ],
  },
  plugins: [
    new CleanWebpackPlugin(),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'windows.jQuery': 'jquery',
    }),
    new CopyWebpackPlugin([
      {
        from: './src/public',
        to: 'public',
      },
      {
        from: './src/partials',
        to: 'partials',
      },
    ]),
    // To strip all locales except “en”
    new MomentLocalesPlugin(),
  ],
  devServer: {
    contentBase: path.join(__dirname, 'src'),
  },
  optimization: {
    runtimeChunk: 'single',
    removeEmptyChunks: true,
    mergeDuplicateChunks: true,
    splitChunks: {
      cacheGroups: {
        vendor: {
          test: /node_modules/,
          chunks: 'initial',
          name: 'vendor',
          priority: 10,
          minChunks: 3,
          reuseExistingChunk: true,
        },
        core: {
          test: /core/,
          chunks: 'initial',
          name: 'core',
          reuseExistingChunk: true,
          priority: 1,
          enforce: true,
        },
        icons: {
          test: /icons/,
          chunks: 'initial',
          name: 'icons',
          reuseExistingChunk: true,
          priority: 1,
          enforce: true,
        },
      },
    },
    minimizer: [],
  },
};

config.plugins = [
  ...config.plugins,
  ...HyperConfig.pages.map(
    page =>
      new HtmlWebPackPlugin({
        template: path.resolve(__dirname, page.template),
        filename: page.filename,
        favicon: path.resolve(__dirname, './src/public/images/favicon.ico'),
        inject: true,
        chunks: page.chunks,
        minify: !IS_DEV && {
          collapseWhitespace: true,
          preserveLineBreaks: true,
          removeComments: true,
        },
      })
  ),
];

config.plugins = [
  ...config.plugins,
  ...[
    new FixStyleOnlyEntriesPlugin(),
    new MiniCssExtractPlugin({
      filename: IS_DEV ? 'css/[name].css' : 'css/[name].[contenthash].css',
      chunkFilename: 'css/[name].css',
    }),
    new webpack.HashedModuleIdsPlugin(),
    new CssUrlRelativePlugin(),
    new CompressionPlugin({
      cache: true,
      filename: '[path].gz[query]',
      algorithm: 'gzip',
      test: /\.js$|\.css$|\.html$/,
      threshold: 10240,
      minRatio: 0,
    }),
  ],
];

if (!IS_DEV) {
  const TerserPlugin = require('terser-webpack-plugin');
  const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');

  config.optimization.minimizer.push(
    new TerserPlugin({ cache: true, parallel: true }),
    new OptimizeCSSAssetsPlugin({})
  );
}

module.exports = config;
