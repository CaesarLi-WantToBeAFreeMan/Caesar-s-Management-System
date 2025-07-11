<template>
    <fieldset id = "form">
        <legend id = "title">signup</legend>
        <fieldset
            class = "input-containers"
            :class = "{'active-fieldset': activeField === 0}"
        >
            <legend class = "labels" :class = "{'active-label': activeField === 0}">username</legend>
            <input
                class = "inputs"
                :class = "{'active-input': activeField === 0}"
                required
                placeholder = "username"
                v-model = "username"
                @focus = "activeField = 0"
            >
        </fieldset>

        <fieldset
            class = "input-containers"
            :class = "{'active-fieldset': activeField === 1}"
        >
            <legend class = "labels" :class = "{'active-label': activeField === 1}">email</legend>
            <input
                class = "inputs"
                :class = "{'active-input': activeField === 1}"
                required
                placeholder = "email"
                v-model = "email"
                @focus = "activeField = 1"
            >
        </fieldset>
        
        <fieldset
            class = "input-containers"
            :class = "{'active-fieldset': activeField === 2}"
        >
            <legend class = "labels" :class = "{'active-label': activeField === 2}">password</legend>
            <input
                type = "password"
                class = "inputs"
                :class = "{'active-input': activeField === 2}"
                required
                placeholder = "password"
                v-model = "password"
                @focus = "activeField = 2"
            >
        </fieldset>

        <fieldset
            class = "input-containers"
            :class = "{'active-fieldset': activeField === 3}"
        >
            <legend class = "labels" :class = "{'active-label': activeField === 3}">ensure password</legend>
            <input
                type = "password"
                class = "inputs"
                :class = "{'active-input': activeField === 3}"
                required
                placeholder = "password"
                v-model = "ensurePassword"
                @focus = "activeField = 3"
            >
        </fieldset>

        <div class = "button-container">
            <button class = "buttons" id = "signup-button" @click = "signup">signup</button>
        </div>
    </fieldset>
</template>

<script lang="ts">
    import {defineComponent} from "vue";
    import axios from "axios";

    const baseURL: string = "http://127.0.0.1:3002/api";

    export default defineComponent({
        name: "Login",
        data(){
            return{
                username: "",
                email: "",
                password: "",
                ensurePassword: "",
                error: "",
                activeField: null as null | number
            };
        },
        methods: {
            async signup(){
                try{
                    const responseBody = await axios.post(`${baseURL}/user/signup`, {
                        username: this.username,
                        email: this.email,
                        password: this.password
                    });
                    localStorage.setItem("token", responseBody.data.token);
                    alert("signup successfully");
                }catch(error: any){
                    this.error = error?.response?.data?.error || "signup failed";
                    alert(error);
                }
            }
        }
    });
</script>

<style lang = "less" scoped>
    #form{
        display: flex;
        flex-direction: column;
        row-gap: 20px;
        padding: 30px 50px;
        width: 30vw;
        justify-content: center;
        box-shadow: 0 0 30px @darkCyan, 0 0 30px @lightCyan;
        border-radius: 50px;
        position: absolute;
        top: 25%;
        right: 10%;

        #title{
            width: 10em;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 30px;
            text-align: center;
            color: @normalRed;
            font-weight: 900;
        }


        .active-fieldset{
            border-color: @primary;
            box-shadow: 0 0 10px @lightCyan;
        }

        .button-container{
            display: flex;
            justify-content: space-around;
        }

        .buttons{
            padding: 10px 20px;
            border-radius: 30px;
            border: none;
            background-color: navy;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease-out;

            &:hover{
                background-color: @lightCyan;
            }
        }
    }
</style>