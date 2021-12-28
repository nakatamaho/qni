module.exports = function (config) {
  config.set({
    basePath: ".",
    frameworks: ["qunit"],
    files: [
      {
        pattern: "app/javascript/components/**/*Element.ts",
        type: "module",
        included: false,
      },
      {
        pattern: "app/javascript/test/**/*.ts",
        type: "module",
        included: true,
      },
    ],
    exclude: [],
    preprocessors: {
      "app/javascript/test/**/*.ts": ["esbuild"],
    },
    reporters: ["dots"],
    autoWatch: false,
    browsers: ["ChromeHeadless"],
    singleRun: true,
    logLevel: config.LOG_INFO,
  })
}