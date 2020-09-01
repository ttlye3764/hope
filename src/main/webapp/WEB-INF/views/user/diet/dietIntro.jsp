<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="body-green">
  <div class="page-wrapper">
    <!-- ******Header****** -->
    <header id="header" class="header bg-grad">
        <div class="container-fluid px-lg-5">
            <div class="row">
              <div class="col-sm-6">
                <div class="branding mb-0">
                <h1 class="logo">
                    <a href="index.html">
                        <img src="assets/logo-light.png" alt="logo">
                        <span class="text-bold mt-2"> | Documentation</span>
                    </a>
                </h1>
              </div><!--//logo-->
              </div>
              <div class="col-sm-6">
                <ul class="text-right list-inline m-0 mt-2">
                  <li class="list-inline-item mr-4"> <a class="btn-link" href="http://wizixo.webestica.com">Live Preview</a> </li>
                  <li class="list-inline-item mr-4"> <a class="btn-link" href="http://support.webestica.com" target="_blank">Support</a> </li>
                </ul>
              </div>
            </div>
        </div><!--//container-->
    </header><!--//header-->
        <div class="doc-wrapper">
            <div class="container-fluid px-lg-5">
              <div class="doc-body row">
                  <div class="doc-content col-md-9 col-12 order-1">
                      <div class="content-inner">

  <section id="start" class="doc-section">
      <h2 class="section-title">Introduction</h2>
      <div class="section-block">
          <p>Thank you for purchasing Wizixo theme! We’re glad that you found what you were looking for. It is our goal that you are always happy with what you bought from us, and We hope that you will be able to create an outstanding website with our theme easily.</p>
          <p>Before proceeding with the theme installation, It is recommended that you follow the steps listed below. We have covered all kinds of necessary information, and provide you with all the guidelines and details that you will need to use Wizixo theme. If you can’t find the answer you’re looking for, We encourage you to reach us through our Support portal. We'll be glad to help you out in your queries. Please Generate ticket through our <a href="http://support.webestica.com" target="_blank">Support portal.</a></p>
      </div>
  </section><!--//doc-section-->

  <!-- *****************************
            Getting Started 
*****************************-->
  <section id="getting-started-section" class="doc-section">
      <h2 class="section-title">Menu List</h2>
      <div class="section-block">
        <ul class="files_structure">
        <div class="col-sm-12 mb-5">
					<h5 class="text-center mb-4">Menu List!!!</h5>
					<div class="table-responsive-sm">
						<table class="table table-lg table-noborder table-striped">
							<thead class="all-text-white bg-grad">
								<tr>
									<th scope="col">#</th>
									<th scope="col">메뉴이름</th>
									<th scope="col">열량</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${menuList }" var="menuInfo" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${menuInfo.menu_name }</td>
									<td>${menuInfo.menu_kcal }</td>
									<td>@mdo</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<a class="btn btn-grad" href="#" style ="color:white" ><i class="fa fa-arrow-right"></i>More</a>
          <!-- doc folder -->
         
       
        </ul>
      </div><!--//section-block-->
  </section><!--//doc-section-->

  <section id="installation-section" class="doc-section">
      <div class="section-block">
        <ul class="files_structure">
        <div class="col-sm-12 mb-5">
					<h5 class="text-center mb-4">Menu List!!!</h5>
					<div class="table-responsive-sm">
						<table class="table table-lg table-noborder table-striped">
							<thead class="all-text-white bg-grad">
								<tr>
									<th scope="col">#</th>
									<th scope="col">메뉴이름</th>
									<th scope="col">열량</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${menuList }" var="menuInfo" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${menuInfo.menu_name }</td>
									<td>${menuInfo.menu_kcal }</td>
									<td>@mdo</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<a class="btn btn-grad" href="#" style ="color:white" ><i class="fa fa-arrow-right"></i>More</a>
          <!-- doc folder -->
         
       
        </ul>
      </div><!--//section-block-->
  </section>  
    <!--//doc-section-->

                      
  <section id="edit-section" class="doc-section">
    <h2 class="section-title">Customization</h2>
    
    <div class="section-block">
      <p>Learn how to create your own style without changing the theme's core files so that you can take advantage of future updates.</p>
      <!-- SCSS Method -->
      <h2 class="mt-4 mb-3">SCSS Method <small>- user.scss (highly recommended)</small></h2>
      <p>We highly recommended to make edits and additions to the template CSS is to use the provided <mark>user-variables.scss</mark> and <mark>user.scss</mark> files located in the <mark>template/assets/scss</mark> folder.</p>
      <ul>
        <li><mark>user-variables.scss</mark> will contain each variable you want to edit. Simply copy the variables you need to edit from the main _variables.scss and paste it in this file. It will automatically override the default values with the new ones.</li>
        <li><mark>_user.scss</mark> will contain styles you want to add or edit.</li>
      </ul>
      <div class="callout-block callout-warning">
        <div class="content ml-0">
            <h4 class="callout-title"><svg width="20" height="18" class="svg-inline--fa fa-exclamation-triangle fa-w-18" aria-hidden="true" data-prefix="fas" data-icon="exclamation-triangle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M569.517 440.013C587.975 472.007 564.806 512 527.94 512H48.054c-36.937 0-59.999-40.055-41.577-71.987L246.423 23.985c18.467-32.009 64.72-31.951 83.154 0l239.94 416.028zM288 354c-25.405 0-46 20.595-46 46s20.595 46 46 46 46-20.595 46-46-20.595-46-46-46zm-43.673-165.346l7.418 136c.347 6.364 5.609 11.346 11.982 11.346h48.546c6.373 0 11.635-4.982 11.982-11.346l7.418-136c.375-6.874-5.098-12.654-11.982-12.654h-63.383c-6.884 0-12.356 5.78-11.981 12.654z"></path></svg> Compiling changes</h4>
            <p class="text-dark mt-3">In order to see the changes, running Gulp command is required. To learn more about Gulp go the <a href="#installation-section">gulp section</a>.</p>
        </div>
      </div>
      <p class="mt-4"><span class="badge badge-danger mr-2">Note:</span>When you update Wizixo, <b>make sure you have backup of your files</b> and not to override the user’s custom file, that may contain styles you have created already. </p>

      <!-- CSS Method -->
      <h2 class="mt-5 mb-3">CSS Method <small>- custom.scss</small></h2>
      <p>If you prefer to work with wizixo as a static source without Gulp and Sass, you will need to add custom CSS through a separate CSS file.</p>
      <p>You just need to link <mark>custom.css</mark> at the end of <mark>&lt;head&gt;</mark> tag of each page. See example below:</p>

<pre>
<code class="language-markup">&lt;link rel="stylesheet" type="text/css" href="assets/css/custom.css" /&gt;</code>
</pre>
    </div>
  </section>

                 
<!-- loading-section -->
<section id="loading-section" class="doc-section">
    <h2 class="section-title">Page Loading (pre-loader)</h2>
    <div class="section-block">
      <p>You can change page pre-loader by changing below img path to your new pre-loader image path.</p>
<pre>
<code class="language-markup">
&lt;div class="preloader"&gt;
  &lt;img src="images/preloader.svg" alt="Pre-loader"&gt;
&lt;/div&gt;

</code>
</pre>
<h6 class="mt-3">How to change Preloader color?</h6>
<p>You can change the preloader color very easily. To do so, Just open <mark>preloader.svg</mark> file in your preferable text editor and change HEX color code with your value. You will also find Instructions in comment section of SVG file when you open this in text editor.</p>


<p class="mt-2"><span class="badge badge-danger mr-2">Note:</span> Page Pre-loader are enabled by default. If you wish to disable the page pre-loader you can simply delete above code from all HTML files. </p>
    </div>
</section>


<!-- logo-section -->
<section id="logo-section" class="doc-section">
<h2 class="section-title">Logo Settings</h2>
<div class="section-block">
  <p>Logo can be changed from below code inside the <mark>header</mark> container.</p>
<pre>
<code class="language-markup">
&lt;!-- Logo --&gt;
        &lt;a class="navbar-brand" href="index.html"&gt;
          &lt;!-- SVG Logo Start --&gt;
          &lt;svg class="navbar-brand-item" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMinYMid" width="325.656" height="100" viewBox="0 0 325.656 100"&gt;
            &lt;defs&gt;
              &lt;linearGradient id="LogoGradient"&gt;
                &lt;stop class="fill-grad-start" offset="0%"/&gt;
                &lt;stop class="fill-grad-end" offset="100%"/&gt;
              &lt;/linearGradient&gt;
            &lt;/defs&gt;
            &lt;g&gt;&lt;path d="M320.187,75.278 C316.545,78.817 312.335,80.585 307.558,80.585 C302.721,80.585 298.497,78.830 294.885,75.322 C291.271,71.813 289.466,67.749 289.466,63.129 L289.466,55.058 C289.466,50.440 291.243,46.404 294.797,42.953 C298.351,39.503 302.605,37.778 307.558,37.778 C312.393,37.778 316.617,39.488 320.231,42.909 C323.843,46.330 325.650,50.381 325.650,55.058 L325.650,63.129 C325.650,67.690 323.828,71.740 320.187,75.278 ZM316.473,55.086 C316.473,52.763 315.583,50.671 313.807,48.813 C312.029,46.954 309.946,46.023 307.558,46.023 C305.111,46.023 303.013,46.954 301.265,48.813 C299.517,50.671 298.643,52.763 298.643,55.086 L298.643,63.103 C298.643,65.485 299.517,67.620 301.265,69.507 C303.013,71.396 305.111,72.339 307.558,72.339 C309.946,72.339 312.029,71.396 313.807,69.507 C315.583,67.620 316.473,65.485 316.473,63.103 L316.473,55.086 ZM285.184,76.023 C285.184,77.018 284.513,78.027 283.173,79.050 C281.832,80.072 280.551,80.585 279.328,80.585 C278.220,80.585 277.434,80.234 276.968,79.532 L267.529,65.058 L258.090,79.532 C257.565,80.234 256.749,80.585 255.642,80.585 C254.535,80.585 253.296,80.087 251.928,79.094 C250.558,78.100 249.874,77.076 249.874,76.023 C249.874,75.440 250.078,74.883 250.486,74.357 L261.323,58.743 L251.010,44.006 C250.602,43.480 250.398,42.953 250.398,42.427 C250.398,41.374 251.083,40.337 252.452,39.313 C253.821,38.290 255.147,37.778 256.429,37.778 C257.478,37.778 258.206,38.129 258.614,38.830 L267.529,52.865 L276.444,38.918 C276.909,38.159 277.667,37.778 278.716,37.778 C279.881,37.778 281.163,38.290 282.562,39.313 C283.960,40.337 284.659,41.374 284.659,42.427 C284.659,42.896 284.454,43.422 284.047,44.006 L273.647,58.830 L284.572,74.357 C284.979,74.883 285.184,75.440 285.184,76.023 ZM238.687,27.865 C237.230,27.865 235.978,27.383 234.929,26.418 C233.880,25.453 233.356,24.328 233.356,23.041 C233.356,21.696 233.880,20.556 234.929,19.620 C235.978,18.685 237.230,18.216 238.687,18.216 C240.143,18.216 241.397,18.685 242.445,19.620 C243.494,20.556 244.019,21.696 244.019,23.041 C244.019,24.328 243.494,25.453 242.445,26.418 C241.397,27.383 240.143,27.865 238.687,27.865 ZM224.617,79.883 L197.435,79.883 C196.387,79.883 195.585,79.560 195.032,78.910 C194.477,78.260 194.202,77.512 194.202,76.665 C194.202,75.659 194.726,74.416 195.775,72.935 L214.478,45.673 L197.872,45.673 C197.115,45.673 196.444,45.307 195.862,44.572 C195.279,43.837 194.988,42.963 194.988,41.946 C194.988,40.930 195.250,40.069 195.775,39.364 C196.299,38.658 196.998,38.304 197.872,38.304 L223.131,38.304 C224.005,38.304 224.748,38.573 225.360,39.109 C225.972,39.646 226.277,40.422 226.277,41.437 C226.277,42.680 225.810,43.954 224.879,45.256 L206.088,72.515 L224.617,72.515 C225.432,72.515 226.131,72.868 226.714,73.574 C227.296,74.280 227.588,75.169 227.588,76.241 C227.588,77.258 227.311,78.119 226.758,78.825 C226.204,79.531 225.491,79.883 224.617,79.883 ZM182.753,27.865 C181.295,27.865 180.043,27.383 178.994,26.418 C177.946,25.453 177.421,24.328 177.421,23.041 C177.421,21.696 177.946,20.556 178.994,19.620 C180.043,18.685 181.295,18.216 182.753,18.216 C184.208,18.216 185.462,18.685 186.511,19.620 C187.560,20.556 188.084,21.696 188.084,23.041 C188.084,24.328 187.560,25.453 186.511,26.418 C185.462,27.383 184.208,27.865 182.753,27.865 ZM158.544,78.918 C158.077,80.146 156.853,80.760 154.873,80.760 C152.891,80.760 151.639,80.175 151.115,79.006 L143.511,56.374 L135.994,78.743 C135.470,80.087 134.159,80.760 132.061,80.760 C130.139,80.760 128.915,80.087 128.391,78.743 L114.844,43.304 C114.610,42.602 114.494,42.106 114.494,41.813 C114.494,40.760 115.134,39.854 116.417,39.094 C117.698,38.334 119.009,37.953 120.350,37.953 C121.806,37.953 122.738,38.510 123.147,39.620 L132.848,66.901 L140.277,42.690 C140.684,41.345 141.763,40.673 143.511,40.673 C145.259,40.673 146.336,41.345 146.745,42.690 L154.086,67.076 L163.875,39.620 C164.225,38.510 165.127,37.953 166.584,37.953 C167.865,37.953 169.163,38.334 170.474,39.094 C171.785,39.854 172.440,40.790 172.440,41.901 C172.440,42.369 172.323,42.837 172.091,43.304 L158.544,78.918 ZM182.753,38.304 C184.092,38.304 185.200,38.582 186.074,39.137 C186.948,39.694 187.385,40.409 187.385,41.287 L187.385,76.813 C187.385,77.574 186.933,78.275 186.030,78.918 C185.126,79.562 184.034,79.883 182.753,79.883 C181.470,79.883 180.393,79.562 179.519,78.918 C178.645,78.275 178.208,77.574 178.208,76.813 L178.208,41.287 C178.208,40.409 178.630,39.694 179.475,39.137 C180.319,38.582 181.412,38.304 182.753,38.304 ZM238.687,38.304 C240.027,38.304 241.134,38.582 242.008,39.137 C242.882,39.694 243.319,40.409 243.319,41.287 L243.319,76.813 C243.319,77.574 242.867,78.275 241.965,78.918 C241.061,79.562 239.968,79.883 238.687,79.883 C237.405,79.883 236.327,79.562 235.453,78.918 C234.579,78.275 234.142,77.574 234.142,76.813 L234.142,41.287 C234.142,40.409 234.564,39.694 235.410,39.137 C236.254,38.582 237.346,38.304 238.687,38.304 Z" class="fill-dark"/&gt;
              &lt;circle cx="50.047" cy="50" r="50.047" fill="url(#LogoGradient)"/&gt;
              &lt;path d="M86.607,38.585 L55.868,69.317 C53.678,71.508 50.126,71.508 47.936,69.317 C45.745,67.127 45.745,63.577 47.936,61.387 L78.674,30.654 C80.865,28.464 84.416,28.464 86.607,30.654 C88.797,32.844 88.797,36.395 86.607,38.585 ZM26.806,69.317 C25.679,70.444 24.193,70.981 22.716,70.948 C22.636,70.953 22.560,70.972 22.478,70.972 L20.552,70.972 C18.108,70.972 16.128,68.992 16.128,66.548 L16.128,33.452 C16.128,31.008 18.108,29.028 20.552,29.028 L22.478,29.028 C24.922,29.028 26.902,31.008 26.902,33.452 L26.902,53.359 L49.612,30.654 C51.802,28.464 55.354,28.464 57.544,30.654 C59.735,32.844 59.735,36.395 57.544,38.585 L26.806,69.317 Z" class="fill-white"/&gt;
            &lt;/g&gt;
          &lt;/svg&gt;
          &lt;!-- SVG Logo End --&gt;
        &lt;/a&gt;
</code>
</pre>

<div class="section-block">
  <p>If you want to place image as logo, then simply replace the SVG code with <mark>img</mark> tag. Like this: </p>
  <code class="language-markup">
    &lt;a class="navbar-brand" href="index.html"&gt;
      &lt;img src="assets/images/yourlogofile.png" alt="Logo"&gt;
    &lt;/a&gt;
  </code>
</div>

<h6 class="mt-3">Logo height:</h6>
<p>By default logo height is <mark>44px</mark>. To change logo height, You should change value in <mark>$navbar-brand-height</mark> in <mark>_variables.scss</mark> file as per your need. Please note that if you increase logo height, your header height will increase automatically. You don't need to change your header height manually.</p>
    </div>
</section>

<!-- fonts-section -->
<section id="fonts-section" class="doc-section">
<h2 class="section-title">Fonts</h2>
  <div class="section-block">
    <p>By default, Wizixo uses the Google fonts. In case, If you want to change font to any other Google fonts, Please have a look in the head part of the webpage and you will find this tag:</p>
<pre>
<code class="language-markup">
&lt;!-- Google Font --&gt;
&lt;link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900%7CPlayfair+Display:400,400i,700,700i%7CRoboto:400,400i,500,700" rel="stylesheet"&gt;

</code>
</pre>
  <p class="mt-3">To change the font, first go to <a href="https://fonts.google.com/" target="_blank">Google fonts</a>, choose your desired font and use the generated code.</p>
  <p class="mt-4">If you have a need to use custom fonts, Remove above section completely and visit <a href="http://css-tricks.com/snippets/css/using-font-face/" target="_blank">Self Hosted Fonts</a></p>
  </div>
</section>

<!-- *****************************
        headers 
*****************************-->

<!-- headers-section -->
<section id="headers-section" class="doc-section">
  <h2 class="section-title">Header Types</h2>
  <div class="section-block">
    <p>Wizixo comes with many predefined header styles. Simply adding the Header type class name to the Header tag will activate the Header Type. The list of Header type classes and it's descriptions are provided below for the reference:</p>
    
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Header Class name</th>
            <th>Description</th>
            <th>Example code</th>
          </tr>
        </thead>
        <tbody>
          <!-- table row -->
          <tr>
            <td><mark>.navbar-light</mark></td>
            <td>Header with white background & dark text.</td>
            <td><pre>
<code class="language-markup">&lt;header class="...... navbar-light"&gt;
      ...
&lt;/header&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.navbar-dark</mark></td>
            <td>Header with dark background & white text. </td>
            <td><pre>
<code class="language-markup">&lt;header class="...... bg-dark navbar-dark"&gt;
      ...
&lt;/header&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.navbar-primary</mark></td>
            <td>Header with primary background & white text. </td>
            <td><pre>
<code class="language-markup">&lt;header class="...... bg-primary navbar-primary"&gt;
      ...
&lt;/header&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.header-transparent</mark></td>
            <td>Header with transparent background. You can use the <mark>.header-dark</mark>, <mark>.header-light</mark> or <mark>.header-primary</mark> class depending on your site background.</td>
            <td><pre>
<code class="language-markup">&lt;header class="...... header-transparent"&gt;
      ...
&lt;/header&gt;</code></pre></td>
          </tr>

          <!-- table row -->
          <tr>
            <td><mark>.navbar-sticky</mark></td>
            <td>Header will stick to the top when scrolling.</td>
            <td><pre>
<code class="language-markup">&lt;header class="...... header-sticky"&gt;
      ...
&lt;/header&gt;</code></pre></td>
          </tr>
          
          
        </tbody>
      </table>
    </div>
  </div>
</section>

<!-- *****************************
        Color scheme 
*****************************-->

<section id="color-scheme" class="doc-section">
  <h2 class="section-title">Theme color scheme</h2>
  <div class="section-block">
    <h4 class="mt-4">How to change theme default color scheme</h4>
    <p>We understand your need of changing theme color scheme at ease so We've got you covered. Whether you want to work with SCSS or CSS, both methods are described below. Please note we highly recommend to go with SCSS method.</p>

    <h5 class="mt-3">#1 Using SCSS</h5>
    <p>After Completing gulp and sass setup, Copy below code and paste it in <mark>_user-variables.scss</mark> file located at <mark>template/assets/scss</mark> and then compile using gulp sass. If you are new to gulp, Please go through Gulp section <a href="#installation-section">here</a>. Follow the steps and you will be able to build your site at very ease.</p>
    <code class="language-markup">
      // User Variables
      $primary:  #f5b150;
      $theme-colors: ();
      $theme-colors: map-merge(
       (
       "primary": $primary,
       "secondary": $secondary,
       "success": $success,
       "info":  $info,
       "warning": $warning,
       "danger":  $danger,
       "light":  $light,
       "dark":  $dark
       ),
       $theme-colors
      );

      //Theme gradient Colors - Starting and ending point
      $grad-start:  #f07a23;
      $grad-end:  #f5b150;

      $link-color: $primary;
      $link-hover-color:   darken($link-color, 10%);
      $navbar-light-hover-color:   $primary;
      $navbar-light-active-color:   $primary;
      $dropdown-link-hover-color:   $primary !important;
      $dropdown-link-active-color:  $primary;
    </code>
    <p class="mt-3">By using this method, You have to change color codes only at three places and all your website color shades will be set properly.</p>
    <p>Gulp must be running in your system to compile this. So when gulp is running, and you put above code into <mark>_user-variables.scss</mark> file and after saving the file, Gulp will compile the same and You will be automatically redirected to your default browser with site opened and changed orange color scheme.</p>

    <h5 class="mt-3">#2 Using CSS</h5>
    <p>If you want to change theme default color scheme just using CSS, You can choose one of the 2 methods (We recommend Method 2 – Using color.css)</p>
    <p><strong>Method 1: Using style.css</strong></p>
    <p>If you don’t want to take advantage of future updates of theme, You can change theme color by replacing your new HEX color code in style.css located in <mark>template/assets/css</mark> directory. Please note this is not recommended option.</p>
    <p><strong>Method 2: Using color.css</strong></p>
    <p>Please look out for color.css file in <mark>template/assets/css</mark> directory for blue color as an example. You should link that CSS at the end in head section after theme CSS like below code:</p>
    <code class="language-markup">
      &lt;!-- Theme CSS --&gt;
      &lt;link rel="stylesheet" type="text/css" href="assets/css/style.css" /&gt;

      &lt;!-- Theme Color CSS --&gt;
      &lt;link rel="stylesheet" type="text/css" href="assets/css/color.css" /&gt;
    </code>

    <p class="mb-0">Provided color.css within theme is for blue color scheme as an example. Please replace your color codes in the same and check the output.</p>

  </div>
</section>

<!-- *****************************
            sliders 
*****************************-->
<section id="sliders-section" class="doc-section">
  <h2 class="section-title">Sliders</h2>
  <div  class="section-block">
    <!-- swiper slider -->
    <h5 class="mt-4" id="swiper-slider">Wizixo Swiper slider</h5>
    <p>Swiper - is the free and most modern mobile touch slider. See Wizixo Swiper slider example code below:</p>
<pre>
<code class="language-markup">
&lt;div class="swiper-container swiper-arrow-hover swiper-slider-fade"&gt;
  &lt;div class="swiper-wrapper"&gt;
    &lt;!-- slide 1--&gt;
    &lt;div class="swiper-slide"&gt;
      &lt;div class="slider-content"&gt;
        [Slider content goes here]
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;!-- slide 2--&gt;
    &lt;div class="swiper-slide"&gt;
      &lt;div class="slider-content"&gt;
        [Slider content goes here]
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- Slider buttons --&gt;
  &lt;div class="swiper-button-next"&gt;&lt;i class="ti-angle-right"&gt;&lt;/i&gt;&lt;/div&gt;
  &lt;div class="swiper-button-prev"&gt;&lt;i class="ti-angle-left"&gt;&lt;/i&gt;&lt;/div&gt;
  &lt;div class="swiper-pagination"&gt;&lt;/div&gt;
&lt;/div&gt;

</code>
</pre>

    <p class="mt-3">Wizixo swiper slider setting can be found in <mark>functions.js</mark> file. You can customize as per your need OR you can use any demos from <a href="http://idangero.us/swiper/demos/">swiper slider demos.</a></p>

<!-- Owl Carousel -->
    <h5 class="mt-5" id="owl-carousel">Owl Carousel</h5>
    <p>Owl Carousel 2 is touch enabled jQuery plugin that lets you create a beautiful responsive carousel slider. See Owl Carousel example code below:</p>
    <pre>
<code class="language-markup">
&lt;div class="owl-carousel"&gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/01.png" alt=""&gt;&lt;/div&gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/02.png" alt=""&gt;&lt;/div&gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/03.png" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;

</code>
</pre>
<br>
<p>We have provided owl Carousel data attributes so you don't need to play with JavaScrips or CSS. The list of owl Carousel data attributes type name and it's descriptions are provided below for the reference: </p>
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Data Attributes name</th>
          <th>Description</th>
          <th>Available options</th>
        </tr>
      </thead>
      <tbody>
        <!-- table row -->
        <tr>
          <td>data-arrow="true"</td>
          <td>Enable or disable arrow</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-dots="false"</td>
          <td>Enable or disable dots</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items="1"</td>
          <td>Slider items in all device.</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items-xs="2"</td>
          <td>Slider items in extra small device. start to 575px</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items-sm="3"</td>
          <td>Slider items in small device. 576px to 767px</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items-md="4"</td>
          <td>Slider items in medium device. 768px to 991px </td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items-lg="5"</td>
          <td>Slider items in large device. 992px to 1199px</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-items-xl="6"</td>
          <td>Slider items in extra large device. 1200 to end</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-autoplay="500"</td>
          <td>Data autoplay time in MS</td>
          <td>number MS</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-speed="1000"</td>
          <td>Data slide speed in MS</td>
          <td>number MS</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-margin="30"</td>
          <td>Margin between 2 slider items in pixel</td>
          <td>number in px</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-loop="true"</td>
          <td>Slider loop enable or disable</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-start="2"</td>
          <td>Number of slide show first</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-slideby="2"</td>
          <td>Number of slider slide at a time</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>

        <!-- table row -->
        <tr>
          <td>data-pause="true"</td>
          <td>Slider pause on mouse hover.</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-merge="2"</td>
          <td>Number of slider merge use in slider items class DIV</td>
          <td>numbers (1 2 3 4 5 6 ....)</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-drag="true"</td>
          <td>Slide on mouse drag</td>
          <td>true or false</td>
        </tr>

        <!-- table row -->
        <tr>
          <td>data-rewind="true"</td>
          <td>Go backwards when the boundary has reached.</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-center="true"</td>
          <td>Start from center of slide item</td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-video="true"</td>
          <td>Enable fetching YouTube/Vimeo/Vzaar videos. <a target="_blank" href="https://owlcarousel2.github.io/OwlCarousel2/demos/video.html">View Example</a></td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-lazyload="true"</td>
          <td>Enable lazy load <a target="_blank" href="https://owlcarousel2.github.io/OwlCarousel2/demos/lazyLoad.html">View Example</a></td>
          <td>true or false</td>
        </tr>
        <!-- table row -->
        <tr>
          <td>data-rtl="true"</td>
          <td>Enable Right to left language</td>
          <td>true or false</td>
        </tr>
      </tbody>
    </table>
  </div>
  <p class="mt-3">See example of how to use owl Carousel data attributes:</p>
  <pre>
<code class="language-markup">
&lt;div class="owl-carousel" data-arrow="true" data-dots="false" data-items-xl="6" data-items-lg="5" data-items-md="4" data-items-sm="3" data-items-xs="2" &gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/01.png" alt=""&gt;&lt;/div&gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/02.png" alt=""&gt;&lt;/div&gt;
  &lt;div class="item"&gt;&lt;img src="images/clients/03.png" alt=""&gt;&lt;/div&gt;
&lt;/div&gt;
</code>
</pre>

<p class="mt-3">There are tons of more options available. Visit <a target="_blank" href="https://owlcarousel2.github.io/OwlCarousel2/docs/started-welcome.html">owl Carousel documentation for more.</a> </p>
</div>
 
</section>

<!-- *****************************
      page elements 
*****************************-->

<!-- elements section-->
<section id="elements-section" class="doc-section">
  <h2 class="section-title mb-5">Page Elements</h2>
  <!-- Page titles -->
  <h4 id="page-title">Page Titles</h4>
  <div class="section-block">
    <p>Use below code to display page title.</p>
    <pre>
<code class="language-markup">
&lt;div class="title text-center"&gt;
  &lt;span class="pre-title"&gt;Pre title&lt;/span&gt;
  &lt;h2&gt;Title&lt;/h2&gt;
  &lt;p&gt;Description&lt;/p&gt;
&lt;/div&gt;

</code>
</pre>
<p class="mt-2"><span class="badge badge-danger mr-2">Note:</span>Use <mark>.text-right</mark> and <mark>.text-center</mark> to display title in right align and center align.</p>
  </div>

<!-- Section padding -->
  <h4 class="mt-4" id="section-padding" >Section padding</h4>
  <div  class="section-block">
    <p>Use below helper class to maintain whole website section padding:</p>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Tag name or Class</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <!-- table row -->
          <tr>
            <td><mark>&lt;section&gt;</mark> </td>
            <td>padding top 5rem and padding bottom 3.8rem</td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.section-pt</mark></td>
            <td>padding top 5rem</td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.section-pb</mark></td>
            <td>padding bottom 3.8rem</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

<!-- Sticky bar section-->
  <h4 class="mt-4"  id="sticky-element" >Sticky sidebar (sticky element)</h4>
  <div  class="section-block">
    <p>You can easily transform your existing Sidebar Content into Sticky Content by adding <mark>.sticky-element</mark> class:</p>
    <pre>
<code class="language-markup">
&lt;!-- Sidebar --&gt;
&lt;div class="col-md-4 sidebar"&gt;
  &lt;div class="sticky-element"&gt;
    &lt;h2&gt;Job details&lt;/h2&gt;
    &lt;ul class="list-unstyled p-0"&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Posted:&lt;/strong&gt; 3 July 2018 &lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Location:&lt;/strong&gt; London &lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Specialism:&lt;/strong&gt; IT &lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Job type:&lt;/strong&gt; Permanent &lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Reference number:&lt;/strong&gt; CRR0001-18 &lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Contact:&lt;/strong&gt; Jessica Mores&lt;/li&gt;
      &lt;li class="mb-3"&gt;&lt;strong&gt;Phone:&lt;/strong&gt; (+251) 854-6308 &lt;/li&gt;
    &lt;/ul&gt;
    &lt;a class="d-block mt-3" href="#"&gt;&lt;i class="fa fa-print mr-2"&gt;&lt;/i&gt; Print&lt;/a&gt;
  &lt;/div&gt;
&lt;/div&gt;
&lt;!-- Sidebar end--&gt;

</code>
</pre>

<p class="mt-2"><span class="badge badge-danger mr-2">Note:</span> Sticky Sidebar currently works best with the Sidebar and Bootstrap Columns. use <mark>.sticky-element</mark> class inside bootstrap columns as above example. </p>

<p>Sticky sidebar offset top can be set from <mark>functions.js</mark> file.</p>
<pre>
<code class="language-javascript">
var stickyBar = function() {
    if($(".sticky-element").length) {
      var $stickyElement = $(".sticky-element");
      if ($(window).width() <= 1024) {
          $stickyElement.trigger('sticky_kit:detach');
      }
      else {
          $stickyElement.stick_in_parent({
              offset_top: 100
          });
      }
    }
};

</code>
</pre>
  </div>

<!-- Back to top -->
  <h4 class="mt-4" id="backtotop" >Back to top</h4>
  <div  class="section-block">
    <p>Use below code to display back to top. Back to top is enabled by default if you want to remove back to top then simple remove below code from all HTML files:</p>
    <pre>
<code class="language-markup">
&lt;div&gt; &lt;a href="#" class="back-top btn btn-grad"&gt;&lt;i class="ti-angle-up"&gt;&lt;/i&gt;&lt;/a&gt; &lt;/div&gt;

</code>
</pre>
  </div>

  <!-- Buttons -->
  <h4 id="buttons">Buttons</h4>
  <div class="section-block">
    <p>You can place button just about anywhere using the CSS Prefix <mark>.btn</mark> and the button name. The list of button type classes and it's descriptions are provided below for the reference:</p>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Class name</th>
            <th>Description</th>
            <th>Example code</th>
          </tr>
        </thead>
        <tbody>
          <!-- table row -->
          <tr>
            <td><mark>.btn-primary</mark></td>
            <td>Primary color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-primary" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-grad</mark></td>
            <td>Gradient color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-grad" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-dark</mark></td>
            <td>Dark color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-dark" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-light</mark></td>
            <td>Light color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-light" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-white</mark></td>
            <td>White color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-white" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-secondary</mark></td>
            <td>Secondary (dark gray) color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-secondary" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-success</mark></td>
            <td>Success (green) color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-success" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-danger</mark></td>
            <td>Danger (red) color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-danger" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-warning</mark></td>
            <td>Warning (yellow) color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-warning" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-info</mark></td>
            <td>Info (cyan) color button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-info" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-link</mark></td>
            <td>Simple link button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-link" href="#"&gt;link&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr class="p-2 d-block"></tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-outline-primary</mark></td>
            <td>Button with borders. To add button with border, You just need to use <mark>outline</mark> after <mark>btn</mark> prefix and then simply button type. For example, <mark>.btn-outline-dark</mark> This will create button with dark border.</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-outline-primary" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <!-- table row -->
          <tr class="p-2 d-block"> </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-round</mark></td>
            <td>Rounded Button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-round btn-primary" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
           <!-- table row -->
          <tr class="p-2 d-block"> </tr>
          <!-- table row -->
          <tr>
            <td></td>
            <td>Button with icon. You can use any font icon before button name.</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-primary" href="#"&gt;
&lt;i class="fa fa-arrow-circle-right"&gt;&lt;/i&gt;Default
&lt;/a&gt;</code></pre></td>
          </tr>
          <tr class="p-2 d-block"> </tr>
          <!-- table row -->
          <tr>
            <td><mark>.btn-xs</mark></td>
            <td>Use this class for mini button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-primary btn-xs" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <tr>
            <td><mark>.btn-sm</mark></td>
            <td>Use this class for small button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-primary btn-sm" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
          <tr>
            <td><mark>.btn-lg</mark></td>
            <td>Use this class for large button</td>
            <td><pre><code class="language-markup">&lt;a class="btn btn-primary btn-lg" href="#"&gt;Button&lt;/a&gt;</code></pre></td>
          </tr>
        </tbody>
      </table>
    </div>


    <!-- Icons -->
  <h4 class="mt-4" id="icons">Font icons</h4>
  <div  class="section-block">
    <p>We have included font awesome and Themify Icons fonts in Wizixo theme. A complete list of icons along with the class names can be found here: <a href="https://fontawesome.com/v4.7.0/cheatsheet/" target="_blank">Font awesome</a> and <a href="https://themify.me/themify-icons" target="_blank">Themify Icons</a></p>
    <h6>Font awesome:</h6>
    <p>You can place Font Awesome icons just about anywhere using the CSS Prefix <mark>fa</mark> and the icon's name. See below example code:</p>
    <pre>
<code class="language-markup">
&lt;i class="fa fa-book"&gt;&lt;/i&gt;

</code>
</pre>

<h6 class="mt-4">Themify Icons:</h6>
<p>You can place Themify Icons icons just about anywhere using icon's name. See below example code:</p>
<pre>
<code class="language-markup">
&lt;i class="ti-arrow-up"&gt;&lt;/i&gt;

</code>
</pre>
  </div>

<!-- Google map -->
<h4 class="mt-4" id="google-map">Google map</h4>
<div  class="section-block">
<p>We have uses 2 types of Google map in Wizixo. Simple Google map with iFrame and Custom Google map with different styles.</p>

<h6>Google map with iFrame:</h6>
<p>Follow below steps to create Google map iFrame.</p>
<ul>
  <li>Go to <a href="https://maps.google.com/">Google map</a></li>
  <li>Search your address in Google map search bar and click on your location or your location pin icon</li>
  <li>Click on Hamburger <i class="fa fa-bars"></i> menu icon and click on <b>Share or embed map</b></li>
  <li>In popup select <b>Embed a map</b> and copy HTML iFrame code</li>
  <li>Past it in your HTML</li>
</ul>
<p>See example code below:</p>
<pre>
<code class="language-markup">
&lt;iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8112338627093!2d144.96300941550422!3d-37.81789024205276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642b4758afc1d%3A0x3119cc820fdfc62e!2sEnvato!5e0!3m2!1sen!2sin!4v1539108561743" width="600" height="450" frameborder="0" style="border:0" allowfullscreen&gt;&lt;/iframe&gt;

</code>
</pre>

<h6 class="mt-5">Custom Google map with different styles:</h6>
<p>We have created 6 styles of google map in wizixo.</p>
<ol>
  <li>Standard map <mark>id="map-standard"</mark></li>
  <li>Silver map <mark>id="map-silver"</mark></li>
  <li>Retro map <mark>id="map-retro"</mark></li>
  <li>Dark map <mark>id="map-dark"</mark></li>
  <li>Night map <mark>id="map-night"</mark></li>
  <li>Aubergine map <mark>id="map-aubergine"</mark></li>
</ol>

<p>You just need to use below code and change id name with above map style id and set your latitude, longitude and address(data-string).</p>
<pre>
<code class="language-markup">
&lt;div class="contact-map o-hidden"&gt;
  &lt;div class="map-wrapper" id="map-standard" data-lat="-37.817274" data-lng="144.955914" data-string="121 King Street, Melbourne
Victoria 3000 Australia" data-zoom="10"&gt;&lt;/div&gt;
&lt;/div&gt;

</code>
</pre>

<h6 class="mt-4">How to find latitude longitude?</h6>
<p>Visit one of below site to find latitude longitude</p>
<ol class="mt-4">
  <li><a target="_blank" href="https://support.google.com/maps/answer/18539?co=GENIE.Platform%3DDesktop&hl=en">Visit Google support article</a></li>
  <li><a target="_blank" href="http://www.mapcoordinates.net/en">Map Coordinates</a></li>
  <li><a target="_blank" href="https://developer.mapquest.com/documentation/tools/latitude-longitude-finder/">Visit latitude longitude finder</a></li>
</ol>
</div>

<!-- animations -->
  <h4 class="mt-4" id="animations">Animations</h4>
  <div  class="section-block">
    <p>You can add animations to any elements in your website. Animations can be shown on scroll appear. See code example below:</p>
<pre>
<code class="language-markup">
&lt;div class="wow bounceInLeft" data-wow-duration="2.5s" data-wow-delay="1s" data-wow-offset="300" data-wow-iteration="2"&gt;
  ...
&lt;/div&gt;

</code>
</pre>

<h6 class="mt-4 mb-3">The animation can be set to:</h6>
<div class="table-responsive">
  <table class="table table-bordered">

  <tbody>
  <tr>
  <td>bounce</td>
  <td>flash</td>
  <td>pulse</td>
  <td>rubberBand</td>
  </tr>
  <tr>
  <td>shake</td>
  <td>headShake</td>
  <td>swing</td>
  <td>tada</td>
  </tr>
  <tr>
  <td>wobble</td>
  <td>jello</td>
  <td>bounceIn</td>
  <td>bounceInDown</td>
  </tr>
  <tr>
  <td>bounceInLeft</td>
  <td>bounceInRight</td>
  <td>bounceInUp</td>
  <td>bounceOut</td>
  </tr>
  <tr>
  <td>bounceOutDown</td>
  <td>bounceOutLeft</td>
  <td>bounceOutRight</td>
  <td>bounceOutUp</td>
  </tr>
  <tr>
  <td>fadeIn</td>
  <td>fadeInDown</td>
  <td>fadeInDownBig</td>
  <td>fadeInLeft</td>
  </tr>
  <tr>
  <td>fadeInLeftBig</td>
  <td>fadeInRight</td>
  <td>fadeInRightBig</td>
  <td>fadeInUp</td>
  </tr>
  <tr>
  <td>fadeInUpBig</td>
  <td>fadeOut</td>
  <td>fadeOutDown</td>
  <td>fadeOutDownBig</td>
  </tr>
  <tr>
  <td>fadeOutLeft</td>
  <td>fadeOutLeftBig</td>
  <td>fadeOutRight</td>
  <td>fadeOutRightBig</td>
  </tr>
  <tr>
  <td>fadeOutUp</td>
  <td>fadeOutUpBig</td>
  <td>flipInX</td>
  <td>flipInY</td>
  </tr>
  <tr>
  <td>flipOutX</td>
  <td>flipOutY</td>
  <td>lightSpeedIn</td>
  <td>lightSpeedOut</td>
  </tr>
  <tr>
  <td>rotateIn</td>
  <td>rotateInDownLeft</td>
  <td>rotateInDownRight</td>
  <td>rotateInUpLeft</td>
  </tr>
  <tr>
  <td>rotateInUpRight</td>
  <td>rotateOut</td>
  <td>rotateOutDownLeft</td>
  <td>rotateOutDownRight</td>
  </tr>
  <tr>
  <td>rotateOutUpLeft</td>
  <td>rotateOutUpRight</td>
  <td>hinge</td>
  <td>jackInTheBox</td>
  </tr>
  <tr>
  <td>rollIn</td>
  <td>rollOut</td>
  <td>zoomIn</td>
  <td>zoomInDown</td>
  </tr>
  <tr>
  <td>zoomInLeft</td>
  <td>zoomInRight</td>
  <td>zoomInUp</td>
  <td>zoomOut</td>
  </tr>
  <tr>
  <td>zoomOutDown</td>
  <td>zoomOutLeft</td>
  <td>zoomOutRight</td>
  <td>zoomOutUp</td>
  </tr>
  <tr>
  <td>slideInDown</td>
  <td>slideInLeft</td>
  <td>slideInRight</td>
  <td>slideInUp</td>
  </tr>
  <tr>
  <td>slideOutDown</td>
  <td>slideOutLeft</td>
  <td>slideOutRight</td>
  <td>slideOutUp</td>
  </tr>
  <tr>
  <td>heartBeat</td>
  <td></td>
  <td></td>
  <td></td>
  </tr>

  </tbody>
</table>
</div>

<h6 class="mt-4 mb-3">Advanced Options:</h6>
<ul>
<li><b>data-wow-duration:</b> Change the animation duration in MS</li>
<li><b>data-wow-delay:</b> Delay before the animation starts in MS</li>
<li><b>data-wow-offset:</b> Distance to start the animation in pixel (related to the browser bottom)</li>
<li><b>data-wow-iteration:</b> Number of times the animation is repeated</li>
</ul>
<p class="mt-4">For more info please <a href="http://mynameismatthieu.com/WOW/docs.html"> Visit WOW.js docs</a></p>
</div>

<!-- Tab -->
  <h4 class="mt-4" id="tab">Tabs</h4>
  <div class="section-block">
   <p>Use below code to display tab:</p>
<pre>
<code class="language-markup">
&lt;ul class="nav nav-tabs"&gt;
  &lt;li class="nav-item"&gt; &lt;a class="nav-link active" data-toggle="tab" href="#tab-1-1"&gt; Tab Title &lt;/a&gt; &lt;/li&gt;
  &lt;li class="nav-item"&gt; &lt;a class="nav-link" data-toggle="tab" href="#tab-1-2"&gt; Tab Title &lt;/a&gt; &lt;/li&gt;
&lt;/ul&gt;
&lt;div class="tab-content"&gt;
  &lt;div class="tab-pane show active" id="tab-1-1"&gt;
    Tab Content
  &lt;/div&gt;
  &lt;div class="tab-pane" id="tab-1-2"&gt;
    Tab Content
  &lt;/div&gt;
&lt;/div&gt;

</code>
</pre>

<p><span class="badge badge-danger mr-2">Note:</span> Make sure you add unique IDs for each tab title and tab-pane. </p>

<p>We have created 8 tab style. you can use any of them by changing class name. </p>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Tab Class name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <!-- table row -->
      <tr>
        <td></td>
        <td>No need any additional class name for default tab. you can use above example to apply this style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.nav-justified</mark></td>
        <td>Tab title in justified</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.tab-line</mark></td>
        <td>tab bottom line style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.tab-bordered</mark></td>
        <td>Tab border style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.tab-grad</mark></td>
        <td>Tab Gradient style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.tab-dark</mark></td>
        <td>Tab dark style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.tab-with-icon</mark></td>
        <td>Tab with icon. You need to set font icon before tab name.</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>tab-with-center-icon justify-content-center nav-justified</mark></td>
        <td>Tab with top icon. You need to set font icon before tab name.</td>
      </tr>
    </tbody>
  </table>
</div>
<p class="mt-3">See below example tab with style:</p>
<code class="language-markup">
&lt;ul class="nav nav-tabs tab-line"&gt;
  &lt;li class="nav-item"&gt; &lt;a class="nav-link active" data-toggle="tab" href="#tab-1-1"&gt; Tab Title &lt;/a&gt; &lt;/li&gt;
  &lt;li class="nav-item"&gt; &lt;a class="nav-link" data-toggle="tab" href="#tab-1-2"&gt; Tab Title &lt;/a&gt; &lt;/li&gt;
&lt;/ul&gt;
&lt;div class="tab-content"&gt;
  &lt;div class="tab-pane show active" id="tab-1-1"&gt;
    Tab Content
  &lt;/div&gt;
  &lt;div class="tab-pane" id="tab-1-2"&gt;
    Tab Content
  &lt;/div&gt;
&lt;/div&gt;

</code>
</pre>
</div>


<!-- accordion  -->
  <h4 class="mt-4" id="accordion">Accordion </h4>
  <div class="section-block">
   <p>Use below code to display Accordion:</p>
<pre>
<code class="language-markup">
&lt;div class="accordion" id="accordion1"&gt;
  &lt;!-- item --&gt;
  &lt;div class="accordion-item"&gt;
    &lt;div class="accordion-title"&gt;
      &lt;h6&gt;&lt;a data-toggle="collapse" href="#collapse-1"&gt;Accordion 1 title&lt;/a&gt;&lt;/h6&gt;
    &lt;/div&gt;
    &lt;div class="collapse show" id="collapse-1" data-parent="#accordion1"&gt;
      &lt;div class="accordion-content"&gt;Accordion 1 content&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- item --&gt;
  &lt;div class="accordion-item"&gt;
    &lt;div class="accordion-title"&gt;
      &lt;h6&gt;&lt;a class="accordion-link collapsed" data-toggle="collapse" href="#collapse-2"&gt;Accordion 2 title&lt;/a&gt;&lt;/h6&gt;
    &lt;/div&gt;
    &lt;div class="collapse" id="collapse-2" data-parent="#accordion1"&gt;
      &lt;div class="accordion-content"&gt;Accordion 2 content&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

</code>
</pre>

<p><span class="badge badge-danger mr-2">Note:</span> Make sure you add unique IDs for each Accordion title, content and data-parent. </p>

<p>We have created 5 Accordion style and few icons styles. You can use any of them by changing class name. </p>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Accordion Class name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <!-- table row -->
      <tr>
        <td></td>
        <td>No need any additional class name for default Accordion. you can use above example to apply this style</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.accordion-primary</mark></td>
        <td>With primary color</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.accordion-grad</mark></td>
        <td>With gradient color</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.accordion-line</mark></td>
        <td>With bottom line</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.accordion-dark</mark></td>
        <td>With dark color</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.toggle-icon-round</mark></td>
        <td>Accordion icon round</td>
      </tr>
      <!-- table row -->
      <tr>
        <td><mark>.toggle-icon-left</mark></td>
        <td>Accordion icon left side</td>
      </tr>
    </tbody>
  </table>
</div>
<p class="mt-3">See below example accordion with style:</p>
<pre>
<code class="language-markup">
&lt;div class="accordion accordion-primary toggle-icon-round toggle-icon-left" id="accordion1"&gt;
  &lt;!-- item --&gt;
  &lt;div class="accordion-item"&gt;
    &lt;div class="accordion-title"&gt;
      &lt;h6&gt;&lt;a data-toggle="collapse" href="#collapse-1"&gt;Accordion 1 title&lt;/a&gt;&lt;/h6&gt;
    &lt;/div&gt;
    &lt;div class="collapse show" id="collapse-1" data-parent="#accordion1"&gt;
      &lt;div class="accordion-content"&gt;Accordion 1 content&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- item --&gt;
  &lt;div class="accordion-item"&gt;
    &lt;div class="accordion-title"&gt;
      &lt;h6&gt;&lt;a class="accordion-link collapsed" data-toggle="collapse" href="#collapse-2"&gt;Accordion 2 title&lt;/a&gt;&lt;/h6&gt;
    &lt;/div&gt;
    &lt;div class="collapse" id="collapse-2" data-parent="#accordion1"&gt;
      &lt;div class="accordion-content"&gt;Accordion 2 content&lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

</code>
</pre>

</div>



</section>
<!-- *****************************
        helper-classes
*****************************-->

<!-- elements section-->
<section id="helper-classes" class="doc-section">
  <h2 class="section-title">helper classes</h2>
  <div class="section-block">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum cumque nisi sit. Ipsam magni quaerat labore eaque dolorum vitae ipsa beatae, molestias sint iure reiciendis aliquid porro vel, recusandae temporibus.
    </p>
  </div>

  <!-- Text Colors -->
  <h4 id="text-colors" class="mt-4">Text Colors</h4>
  <div class="section-block">
    <p>You can add this helper class to any element in your HTML code to set text color:</p>
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Class name</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <!-- table row -->
          <tr>
            <td><mark>.text-primary</mark></td>
            <td>Main primary color text</td>
          </tr>
          <tr>
            <td><mark>.text-white</mark></td>
            <td>White color text</td>
          </tr>
          <tr>
            <td><mark>.all-text-white</mark></td>
            <td>All White color text</td>
          </tr>
          <tr>
            <td><mark>.text-dark</mark></td>
            <td>Dark color text</td>
          </tr>
          <tr>
            <td><mark>.text-grad</mark></td>
            <td>Gradient color text</td>
          </tr>
        </tbody>
      </table>
    </div>
    <p>You can also use <a href="https://getbootstrap.com/docs/4.0/utilities/colors/">bootstrap color classes.</a></p>
  </div>
  

  <!-- Extra helper classes -->
  <h4 id="extra-helper" class="mt-4">Extra helper classes</h4>
  <div class="section-block">
    <p>We have created some really useful helper classes for you. Here are a few of them:</p>
    <ul>
      <li><mark>.zoom-on-hover</mark> Zoom on hover </li>
      <li><mark>.up-on-hover</mark> Slide Up on hover </li>
      <li><mark>.primary-hover</mark> Primary color on a tag of this class </li>

      <li><mark>.title-font</mark> font family primary (Poppins)</li>
      <li><mark>.body-font</mark> font family secondary (Roboto)</li>
      <li><mark>.alt-font</mark> font family tertiary (Playfair Display)</li>
      <br>
      <li><mark>.shadow</mark> 30px box shadow </li>
      <li><mark>.shadow-light</mark> 10px box shadow </li>
      <li><mark>.no-shadow</mark> box shadow none </li>
      <li><mark>.shadow-hover</mark> Shadow on hover </li>
      <br>
      <li><mark>.border-radius-3</mark> Border radius 3 </li>
      <li><mark>.border-radius-0</mark> Border radius 0 </li>
      <li><mark>.border-radius-left-0 </mark> Border radius left 0  </li>
      <li><mark>.border-radius-right-0 </mark> Border radius right 0  </li>
      <br>
      <li><mark>.border</mark> 1px solider border </li>
      <li><mark>.border-right-0</mark> border right 0 </li>
      <li><mark>.border-left-0</mark> border left 0 </li>
      <li><mark>.border-dotted</mark> 2px dotted border </li>
      <li><mark>.border-dashed</mark> 2px dashed border </li>
      <br>
      <li><mark>.o-hidden</mark> Overflow  hidden </li>
      <li><mark>.o-visible</mark> Overflow  visible </li>
      <li><mark>.o-scroll</mark> Overflow  scroll </li>
      <br>
      <li><mark>.pos-absolute-center</mark> Position absolute with content center </li>
      <li><mark>.left-0</mark> left 0 </li>
      <li><mark>.right-0</mark> right 0 </li>
      <li><mark>.top-0</mark> top 0 </li>
      <li><mark>.bottom-0</mark> bottom 0 </li>
     
    </ul>
  </div>
</section>


<!-- *****************************
        Contact
*****************************-->
<section id="contact" class="doc-section">
  <h2 class="section-title">Contact Form</h2>
  <div class="section-block">
    <p>To make contact form work, simply go to <mark>template/include/contact-action.php</mark> file. Look out for <mark>$recip_address = "info@yourdomain.com";</mark> on line number 11 and replace your email there. If you want to add multiple email recipients, Please follow the instructions written at line number 13 in contact-action.php file.</p>
  </div>

<!-- *****************************
           tips
*****************************-->
<!-- tips-section -->
<section id="tips-section" class="doc-section">
  <h2 class="section-title">Our Tips</h2>
  <p class="mt-3">Check out some of our tips and tricks that will speed up your website and work process.</p>
  
<div id="general" class="section-block">
  <h3 class="mb-3">General tips</h3>
    <ul>
      <li> We recommend <a href="http://www.sublimetext.com/3" target="_blank">Sublime Text</a> software that is light-weight and super easy to use.</li>
      <li> We recommend <a href="https://filezilla-project.org/download.php" target="_blank">FileZilla</a> FTP manager.</li>
      <li>When you finish with your site make sure you check below points:</li>
      <ul>
        <li>Make sure you don't have any console error in your console log</li>
        <li>Validate your code with <a href="https://validator.w3.org/">W3C Markup Validation Service</a></li>
      </ul>
    </ul>
</div>

</section>

<!-- *****************************
           FAQs
*****************************-->
<section id="faqs" class="doc-section">
  <h2 class="section-title">FAQs</h2>
  <ol class="mt-4">
    <li class="mb-1"><p class="mb-1"><strong>Why there are no images that were in live demo?</strong></p><p class="mb-10">All images are only for demonstration purpose, however you can re-download them from sites we have listed in <a href="#credits" class="scrollto">Credits section.</a></p></li>
    <li class="mb-1"><p class="mb-1"><strong>Why some videos might not work? </strong></p>
      <p> Ajax methods of Jquery are used for some videos and they can work only on the real server. For the correct operation of all functions, upload your website on a real server.</p>
    </li>
    <li class="mb-1"><p><strong>Why contact form doesn’t work?</strong></p>
      <p>For the correct operation of contact form, the php support is necessary. Upload your website on a server with support of PHP and PHP mail() function.</p>
    </li>
  </ol>
</section>

<!-- *****************************
           Source & Credits
*****************************-->
<section id="credits" class="doc-section">
  <h2 class="section-title">Source & Credits</h2>
  <p class="mt-4">All images are only for demonstration purpose, however you can re-download them in sites below. </p>
  
  <h4 class="mt-5 mb-3">Images</h4>
  <ul>
    <li class="mb-1"><a href="https://www.freepik.com/" target="_blank">Freepik</a></li>
    <li class="mb-1"><a href="http://nothingtochance.co/" target="_blank">Nothing to chance</a></li>
    <li class="mb-1"><a href="https://www.pexels.com/" target="_blank">Pexels</a></li>
    <li class="mb-1"><a href="https://www.flaticon.com/packs/editorial-design-15" target="_blank">Flaticon</a></li>
  </ul>

  <h4 class="mt-5 mb-3">jQuery</h4>
  <ul>
    <li class="mb-1"><a href="http://www.jquery.com/" target="_blank">jQuery</a></li>
    <li class="mb-1"><a href="http://idangero.us/swiper/" target="_blank">Swiper</a></li>
    <li class="mb-1"><a href="https://owlcarousel2.github.io/OwlCarousel2/index.html" target="_blank">OwlCarousel</a></li>
    <li class="mb-1"><a href="http://fitvidsjs.com/" target="_blank">Fitvids</a></li>
    <li class="mb-1"><a href="https://github.com/bas2k/jquery.appear/" target="_blank">jquery appear</a></li>
    <li class="mb-1"><a href="https://github.com/mhuggins/jquery-countTo" target="_blank">jquery countTo</a></li>
    <li class="mb-1"><a href="https://isotope.metafizzy.co/" target="_blank">isotope</a></li>
    <li class="mb-1"><a href="http://gsgd.co.uk/sandbox/jquery/easing/" target="_blank">jquery easing</a></li>
    <li class="mb-1"><a href="https://wowjs.uk/" target="_blank">WOW js</a></li>
    <li class="mb-1"><a href="http://fancyapps.com/fancybox/" target="_blank">Fancy box</a></li>
    <li class="mb-1"><a href="http://leafo.net/sticky-kit/" target="_blank">Sticky kit</a></li>
    <li class="mb-1"><a href="https://codyhouse.co/gem/css-animated-headlines" target="_blank">Animated headlines</a></li>
    <li class="mb-1"><a href="https://github.com/nk-o/jarallax" target="_blank">Jarallax</a></li>
  </ul>

  <h4 class="mt-5 mb-3">CSS and Fonts</h4>
  <ul>
    <li class="mb-1"><a href="http://getbootstrap.com/" target="_blank">Bootstrap 4</a></li>
    <li class="mb-1"><a href="https://daneden.github.io/animate.css/" target="_blank">animate</a></li>
    <li class="mb-1"><a href="https://themify.me/themify-icons" target="_blank">themify icons</a></li>
    <li class="mb-1"><a href="https://fontawesome.com/v4.7.0/" target="_blank">fontawesome 4.7.0</a></li>
    <li class="mb-1"><a href="https://fonts.google.com/" target="_blank">google fonts</a></li>
  </ul>

  <h4 class="mt-5 mb-3">PHP</h4>
  <ul>
    <li class="mb-1"><a href="https://github.com/PHPMailer/PHPMailer/" target="_blank">PHPMailer</a></li>
  </ul>
</section>
<!-- *****************************
           Source & Credits
*****************************-->
<section id="changelog" class="doc-section">
  <h2 class="section-title">Changelog</h2>

  <!-- Log -->
  <h5 class="mt-4">v1.1.0 - 23rd January 2020</h5>
  <ul>
    <li class="mb-2">Update</li>
    <ul>
      <li class="mb-2">Bootstrap 4.4.1</li>
    </ul>
  </ul>

  <!-- Log -->
  <h5 class="mt-4">v1.0.1 - 16 September 2019</h5>
  <ul>
    <li class="mb-2">Documentation updates</li>
    <ul>
      <li class="mb-2">Added: theme color scheme changing guide</li>
      <li class="mb-2">Added: logo image changing guide</li>
      <li class="mb-2">Updated: contact form using guide</li>
    </ul>
    <li class="mb-2">Fixed: contact form issue (sending e-mail 2 times)</li>
      <ul>
        <li>Updated <mark>template/contact.html</mark> </li>
        <li>Updated <mark>template/assets/include/contact-action.php</mark> </li>
      </ul>
    <li class="mb-2">Fixed: owl carousel data-autoplay attribute</li>
      <ul>
        <li>Updated <mark>template/assets/js/functions.js</mark> </li>
      </ul>
  </ul>

  <!-- Log -->
  <h5 class="mt-4">v1.0.0 - 26 March 2019</h5>
  <ul>
    <li class="mb-2">Initial Release</li>
  </ul>

</section>
<!-- *****************************
           Support
*****************************-->
<section id="support" class="doc-section">
  <h2 class="section-title">Support</h2>
  <p class="mt-4">We've tried to make this documentation as easy and understandable as possible. However, in case of any difficulties with the theme, you can contact our technical support department with any suggestions regarding documentation and theme improvement.</p>
<!--   <p>There are a few ways to get support:</p> -->
  <ul>
    <!-- <li class="mb-1">Direct email to <a href="mailto: webestica@gmail.com">webestica@gmail.com</a></li> -->
    <li class="mb-1">Generate ticket through our <a href="http://support.webestica.com" target="_blank">Support portal</a></li>
  </ul>

  <h3 class="mb-3">
    Included in Support:
  </h3>
  <ul>
    <li class="mb-1">Fixing all issues related to original theme.</li>
    <li class="mb-1">Answers to questions regarding theme.</li>
    <li class="mb-1">Providing regular updates depending on your needs and feedbacks.</li>
  </ul>

  <h3 class="mb-3">
    Not Included in Support:
  </h3>
  <ul>
    <li class="mb-1">Customization of theme.</li>
    <li class="mb-1">Specific support for third party plugins integrated in theme.</li>
  </ul>
  <p>Your read it entirely. Thanks!</p>
</section>

                          
  </div><!--//content-inner-->
</div><!--//doc-content-->

<!-- **************************
       sidebar start
************************** -->
<div class="doc-sidebar col-md-3 col-12 order-0 d-none d-md-flex">
  <div id="doc-nav" class="doc-nav">

    <nav id="doc-menu" class="nav doc-menu flex-column sticky-element">
      <a class="nav-link scrollto" href="#start">Introduction</a>
      <!-- Start -->
      <a class="nav-link scrollto" href="#getting-started-section">Menu List</a>
        <nav class="doc-sub-menu nav flex-column">
          <a class="nav-link scrollto" href="#getting-started-section">Getting Started</a>
          <a class="nav-link scrollto" href="#installation-section">Gulp</a>
          <a class="nav-link scrollto" href="#edit-section">Customization</a>
          <a class="nav-link scrollto" href="#loading-section">Page Loading</a>
          <a class="nav-link scrollto" href="#logo-section">Logo Settings</a>
          <a class="nav-link scrollto" href="#fonts-section">Fonts</a>
        </nav>
      <!-- Header -->
      <a class="nav-link scrollto" href="#headers-section">Recommend Diet</a>
      <!-- Color scheme -->
      <a class="nav-link scrollto" href="#color-scheme">Theme Color scheme</a>
      <!-- Page slider -->
      <a class="nav-link scrollto" href="#elements-slider">Sliders</a>
        <nav class="doc-sub-menu nav flex-column">
          <a class="nav-link scrollto" href="#swiper-slider">Swiper slider</a>
          <a class="nav-link scrollto" href="#owl-carousel">Owl Carousel</a>
        </nav>
      <!-- Page Elements -->
      <a class="nav-link scrollto" href="#elements-section">Page Elements</a>
        <nav class="doc-sub-menu nav flex-column">
          <a class="nav-link scrollto" href="#page-title">Page Title</a>
          <a class="nav-link scrollto" href="#section-padding">Section padding</a>
          <a class="nav-link scrollto" href="#sticky-element">Sticky sidebar</a>
          <a class="nav-link scrollto" href="#backtotop">Back top top</a>
          <a class="nav-link scrollto" href="#buttons">Buttons</a>
          <a class="nav-link scrollto" href="#icons">Icons</a>
          <a class="nav-link scrollto" href="#google-map">Google map</a>
          <a class="nav-link scrollto" href="#animations">Animations</a>
          <a class="nav-link scrollto" href="#tab">Tab</a>
          <a class="nav-link scrollto" href="#accordion">Accordion</a>
        </nav>
      <!-- Helper Classes -->
      <a class="nav-link scrollto" href="#helper-classes">Helper Classes</a>
        <nav class="doc-sub-menu nav flex-column">
          <a class="nav-link scrollto" href="#text-colors">Text Colors</a>
          <a class="nav-link scrollto" href="#extra-helper">Extra helper classes</a>
        </nav>
      <!-- Contact -->
      <a class="nav-link scrollto" href="#contact">Contact Form</a>

      <!-- Our Tips -->
      <a class="nav-link scrollto" href="#tips-section">Our Tips</a>
        <nav class="doc-sub-menu nav flex-column">
          <!-- <a class="nav-link scrollto" href="#optimization">Optimization Tips</a> -->
          <a class="nav-link scrollto" href="#general">General tips</a>
        </nav>
      <!-- FAQs -->
      <a class="nav-link scrollto" href="#faqs">FAQs</a>
      <!-- Credit -->
      <a class="nav-link scrollto" href="#credits">Source & Credits</a>
      <a class="nav-link scrollto" href="#changelog">Changelog</a>
      <!-- Support -->
      <a class="nav-link scrollto" href="#support">Support</a>



    </nav><!--//doc-menu-->

  </div>
</div>
<!-- **************************
       sidebar End
************************** -->

      </div><!--//doc-body-->              
    </div><!--//container-->
  </div><!--//doc-wrapper-->
</div><!--//page-wrapper-->
    
<footer id="footer" class="footer text-center">
    <div class="container">
        <small class="copyright">Copyright 2019 | <a href="http://www.webestica.com" target="_blank">WEBESTICA</a></small>
    </div><!--//container-->
</footer><!--//footer-->
    

</body>

