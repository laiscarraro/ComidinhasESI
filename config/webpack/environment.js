const { environment, config } = require('@rails/webpacker')
const webpack = require ('webpack')

const WebpackerPwa = require('webpacker-pwa')
new WebpackerPwa(config, environment)

// environment.plugins.append('Provide',
// new webpack.ProvidePlugin({
//     $:'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js','default']
// })
// )

module.exports = environment
