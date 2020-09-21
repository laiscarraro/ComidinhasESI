const { environment } = require('@rails/webpacker')
<<<<<<< HEAD

=======
>>>>>>> e882a2cfd75e4a76af0f00954f65d3c5e7a5efec
const webpack = require ('webpack')
environment.plugins.append('Provide',
new webpack.ProvidePlugin({
    $:'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js','default']
})
)
<<<<<<< HEAD

=======
>>>>>>> e882a2cfd75e4a76af0f00954f65d3c5e7a5efec
module.exports = environment
