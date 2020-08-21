# Hyper Webpack
We would like to thank you for purchasing Hyper :). The following guideline will help you to get started with the hyper and its documentation.


#### Features

- **Bootstrap** and **jQuery** installed
- Support **ES6** Syntax (**Babel 7**)
- **ESLint** + **Prettier** = **Neat Coding Style**
- Webpack production building (**code splitting**, **cache**, **lazy-loading** and [**Terser**](https://github.com/terser-js/terser))

#### Docs

The `docs` directory contains all the static resources required for docs and examples. To view, just open in your favorite browser!

```
$ open docs/index.html
```
Once you open the documentation. Just click on `Getting Started` link from left, this page is containing instructions to get started with Hyper Webpack. Optionally, you can review quick setup guide described below.

#### Quick Setup
You'll need to install Node.js, Yarn and Git before using our included gulpfile.js. Note that the detailed instructions are available in `docs/index.html` too.

To install Node visit [https://nodejs.org/download](https://nodejs.org/download/).

To install Yarn, visit [https://yarnpkg.com/lang/en/](https://yarnpkg.com/lang/en/).

To install Git, visit [https://git-scm.com/](https://git-scm.com/).

Now you are ready to setup Hyper Webpack, just open your terminal, go to the webpack folder and run below command:

```
$ yarn install
```

From here on out, simply run `yarn start` or below mentioned command from your terminal and you're good to go!

+ `yarn start` - Runs the project locally, starts the development server and watches for any changes in your code, including your html, javascript, sass, etc. The development server is accessible at http://localhost:8080.
+ `yarn build` - It will create a build folder inside your folder. It bundles for production use and optimizes the build for the best performance. The build is minified and the filenames include the hashes. Your app is now ready to be deployed.
