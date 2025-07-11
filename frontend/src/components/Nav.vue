<template>
    <nav id = "nav">
        <div id = "logo-container">
            <router-link :to = "{name: 'home'}" title = "home">
                <img class = "icons" src = "../assets/icons/home.png">
            </router-link>
        </div>
        <div id = "account-container">
            <router-link :to = "{name: 'login'}" class = "button-containers button-titles"
                         title = "login">
                <img class = "icons" src = "../assets/icons/login.png">
                login
            </router-link>

            <router-link :to = "{name: 'signup'}" class = "button-containers button-titles"
                         title = "signup">
                <img class = "icons" src = "../assets/icons/signup.png">
                signup
            </router-link>

            <!--
            <router-link :to = "{name: 'account'}" class = "button-containers">
                <img class = "icons" src = "../assets/icons/account.png">
                <span class = "button-titles">account</span>
            </router-link>
            -->
        </div>
    </nav>
</template>

<script lang = "ts">
    export default {
        name: "Nav"
    };
</script>

<style lang = "less" scoped>
    #nav{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 10%;
        background-color: #404245;
        border-bottom: 3px solid cyan;

        #logo-container{
            display: flex;
            align-items: center;
        }

        #account-container{
            display: flex;
            align-items: center;
            column-gap: 30px;
        }
    }
</style>