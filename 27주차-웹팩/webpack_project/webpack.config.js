/* 선언부 */
// webpack 모듈과 node.js의 path을 사용할 경우 선언.
const webpack = require('webpack');
const path = require('path');
// mini-css-extract-plugin 플러그인을 사용하기 위해 선언.
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
	/* context */
	// 모듈의 파일 위치 등 설정.
	// 설정하지 않을 경우 dist 폴더안에 설정된다.
	context: path.resolve(__dirname, 'WebContent'),
	
	/* entry */
	// 번들에 사용할 엔트리 파일을 설정하는 부분.
	// key는 엔트리 파일의 이름, value가 모듈 파일을 입력.
	// value를 배열형으로 선언하면 여러 파일을 하나의 엔트리에 넣을 수 있다.
	entry: {
		bundle : ['./entry2.js']
	},
	
	/* output */
	// 번들 파일의 파일명과 저장될 디렉토리를 설정하는 부분.
	// filename : 파일명을 설정. [name], [id], [hash] 등등 예약어를 입력할 수 있다.
	// path : 저장될 디렉토리를 설정. [hash], [chunkhash]를 사용하여 해쉬값을 넣을 수 있음.
	// publicPath : 서버상의 경로. webpack 런타임 시 각종 로더에서 사용되는 URL앞에 공통적으로 붙음.
	//			   ex)
	//                 background-image: url(/img.png)
	//                 publicPath에 /img/를 기입 후 loader 사용] ↓
	//                 background-image: url(/img/img.png)
	// 
	// library : 번들링한 js를 라이브러리화 하여 사용하게 끔 함.
	// libraryTarget : 라이브러리 모듈 형태. 일반적으로 var를 사용하며 commonJs, AMD 등이 있음
	output: {
		path: path.resolve(__dirname, 'WebContent/bundle'),
		filename: '[name].js',
		publicPath: '/',
		library: 'commonLib',
		libraryTarget:'var', 
	},

	/* module */
	// 추가적으로 사용할 모듈 명세. loader 사용이 여기서 이뤄진다.
	// test에는 확장자명에 대한 정규표현식이 들어간다.
	// 로더의 선언 순서대로 빌드를 시작하기 때문에 순서도 중요함.
	// exclude는 로더 작동이 제외할 폴더나 파일들을 설정하는 부분이다. 배열로 선언 가능.
	module: {
	  rules: [
		{ test: /\.js$/,
		  loader : 'babel-loader',
	  	  options: {
	  		/* babel presets 설정  */
	  		// preset-env : 브라우저에서 필요한 ECMA 버전을 자동으로 파악해서 알아서 polyfill을 넣어줌.
	  		// preset-stage-0 : 보다 더 실험적인 최신 기술 사용 시 사용.
	  		//                  0 - 아이디어, 1 - 제안, 2 - 초안, 3 - 후보, 4 - 완료.
	  		// babel 7부터 중요도가 떨어져서 삭제되고 plugIn 쪽으로 넘어감.
	        presets: [
	          [
	            '@babel/preset-env', {
	              /* tagets */
	              // 브라우저 호환 리스트 등을 기입할 수 있음. 
	              // 디폴트는 미기입이며 모든 문법을 es2015에 맞춰 변환한다.
	              targets: {}, 
	            }
	          ],
	          // ['@babel/preset-stage-0'] // 이젠 plugIn
	        ],
	      },
	      
		  exclude: ['/node_modules/']
		},
		{ test: /\.js$/, 
		  enforce: 'pre', // 다른 로더가 실행되기 전에 실행시켜서 이슈를 점검한다.
		  loader: 'eslint-loader',
		  exclude: ['/node_modules/']
		},
		{ test: /\.css$/,
		  use : [
			  	 'style-loader',
			  	 'css-loader'
			  	],
		  exclude: /node_modules/
		},
	    { test: /\.s[ac]ss$/,
		  use : [
			     MiniCssExtractPlugin.loader, // 사용할 플러그인을 로더에 기입.
			     'css-loader',
			     'sass-loader'
			    ],
		  exclude: /node_modules/
	    }
	  ]
	},
	devtool: 'cheap-eval-source-map',
	/* plugins */
	// 사용할 플러그인들을 module과 별개로 기입한다.
    plugins: [
        new MiniCssExtractPlugin({ filename: 'sass.css' })
    ],
    
    /* optimization */
    // 웹팩의 최적화 관련 옵션. 자주쓰이는 플러그인이 여기에 포함됨.
    // minimize : js 난독화 및 최소화. (구) UglifyJsPlugin
    // splitChunks : 번들 자동 분할 도구. 대형 프로젝트 사용 시 쓰임.
    // concatenateModules : 웹팩 모듈 성능 최적화 관련된 기능.
    optimization: {
	    minimize: false,
	    splitChunks: {},
	    concatenateModules: true,
    }
};
