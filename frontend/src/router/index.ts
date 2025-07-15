import {createRouter, createWebHistory, RouteRecordRaw} from "vue-router";
import Home from "@/components/Home.vue";
import Login from "@/components/Login.vue";
import Signup from "@/components/Signup.vue";

const routes: Array <RouteRecordRaw> = [
    {
        path: "/",
        name: "home",
        component: Home
    },
    {
        path: "/login",
        name: "login",
        //component: () => import("@/components/Login.vue")
        component: Login
    },
    {
        path: "/signup",
        name: "signup",
        //component: () => import("@/components/Signup.vue")
        component: Signup
    }
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
});

export default router;