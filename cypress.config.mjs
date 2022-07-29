import { defineConfig } from "cypress";
import webpack from "@cypress/webpack-preprocessor";
import preprocessor from "@badeball/cypress-cucumber-preprocessor";

export async function setupNodeEvents(on, config) {
  await preprocessor.addCucumberPreprocessorPlugin(on, config);

  on(
      "file:preprocessor",
      webpack({
        webpackOptions: {
          resolve: {
            extensions: [".ts", ".js"],
          },
          module: {
            rules: [
              {
                test: /\.feature$/,
                use: [
                  {
                    loader: "@badeball/cypress-cucumber-preprocessor/webpack",
                    options: config,
                  },
                ],
              },
            ],
          },
        },
      })
  );

  // Make sure to return the config object as it might have been modified by the plugin.
  return config;
}

export default defineConfig({
  projectId: 'm8ovoz',
  video: false,
  viewportHeight: 800,
  viewportWidth: 1280,
  e2e: {
    // We've imported your old cypress plugins here.
    // You may want to clean this up later by importing these.
    setupNodeEvents,
    specPattern: 'cypress/e2e/**/*.feature',
    baseUrl: 'https://jonatas-fischer.gambiocloud.com',
  },
})