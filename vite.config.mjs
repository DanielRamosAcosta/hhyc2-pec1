import posthtml from "@vituum/vite-plugin-posthtml";
import htmlMinifier from "vite-plugin-html-minifier";
import { ViteImageOptimizer as viteImageOptimizer } from "vite-plugin-image-optimizer";

export default {
  plugins: [posthtml(), htmlMinifier({ minify: true }), viteImageOptimizer()],
};
