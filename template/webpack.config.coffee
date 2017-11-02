path                          = require('path')
ExtractTextPlugin             = require('extract-text-webpack-plugin')
HtmlWebpackPlugin             = require('html-webpack-plugin')
webpack                       = require 'webpack'

module.exports =
  context: path.resolve(__dirname, 'src')
  stats: children: false
  devtool: 'source-map'
  entry:
    app: './app.coffee'
  output:
    path: path.resolve(__dirname, 'build')
    filename: '[name].bundle.js'
  module: rules: [
    { test: /\.coffee/, use: 'coffeescript-loader' }
    { test: /\.pug/,    use: 'pug-loader' }
  ]
  plugins: [
    new ExtractTextPlugin('[name].css')
    new HtmlWebpackPlugin(
      filename: 'index.html'
      template: 'app.pug'
      inject: 'body'
      chunks: ['app']
    )
  ]
  resolve: 
    extensions: ['.js', '.json', '.coffee']
    alias: 
      'vue$': 'vue/dist/vue.esm.js'
  

