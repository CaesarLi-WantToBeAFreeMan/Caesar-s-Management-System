<template>
    <div class = "login-view">
        <LoginForm/>
    </div>
</template>

<script lang = "ts">
    import LoginForm from "@/components/Login.vue";

    export default{
        name: "LoginView",
        components: {
            LoginForm
        }
    };
</script>

<style lang = "less" scoped>
</style>