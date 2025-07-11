<template>
    <header>
        <Nav/>
    </header>

    <main>
        <router-view/>
    </main>
</template>

<script lang = "ts">
    import Nav from "@/components/Nav.vue";

    export default{
        name: "App",
        components: {
            Nav
        }
    };
</script>

<style lang = "less" scoped>
</style>