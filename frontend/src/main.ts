import {createApp} from "vue";
import App from "./App.vue";
import router from "./router";
import "@/styles/index.less";

createApp(App).use(router).mount("#app");