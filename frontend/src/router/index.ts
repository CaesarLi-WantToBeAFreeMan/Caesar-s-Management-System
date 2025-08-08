import {createRouter, createWebHistory, RouteRecordRaw} from "vue-router";
import Home from "@/views/Home.vue";

const routes: Array <RouteRecordRaw> = [
    {
        path: "/",
        name: "home",
        component: Home
    },
    /*
    {
        path: '/about',
        name: 'about',
        component: () => import('../views/AboutView.vue')
    }
    */
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
});

export default router;