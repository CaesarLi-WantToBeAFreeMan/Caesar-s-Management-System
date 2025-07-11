module.exports = {
    devServer: {
        proxy: {
            "/api": {
                target: "http://localhost:3002",
                changeOrigin: true
            }
        }
    },
    css: {
        loaderOptions: {
            less: {
                additionalData: `@import "@/assets/styles/index.less";`
            }
        }
    }
};