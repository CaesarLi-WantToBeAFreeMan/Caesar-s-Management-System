<template>
    <fieldset id = "auth-form-container" class = "auth-form-fieldsets">
        <legend id = "auth-form-title" class = "auth-form-legends">login</legend>
        <fieldset
            v-for = "(field, index) in fields"
            :key = "index"
            class = "auth-form-fieldsets"
            :class = "getClasses(index, field, 'fieldsets')"
        >

            <legend
                class = "auth-form-legends"
                :class = "getClasses(index, field, 'legends')"
            >
                {{field.label}}
            </legend>

            <input
                :type = "field.type"
                class = "auth-form-inputs"
                :class = "getClasses(index, field, 'inputs')"
                required
                :placeholder = "field.label"
                v-model = "field.model.value"
                @focus = "activeField = index"
            >
        </fieldset>

        <div id = "auth-form-button-container">
            <button class = "auth-form-buttons" id = "forget-password-button">forget password</button>
            <button class = "auth-form-buttons" id = "login-button" @click = "login">login</button>
        </div>
    </fieldset>
</template>

<script lang = "ts" setup>
    import {ref, computed} from "vue";
    import {useRouter} from "vue-router";

    //variables
    const   router = useRouter(),
            email = ref(""),
            password = ref(""),
            activeField = ref(0),

    //validators, validation functions
            isEmailValid = computed(
                () => email.value === "" ? false : /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)
            ),
            isPasswordValid = computed(
                () =>   password.value === "" ||//not empty
                        password.value.length < 9 ||//length in the interval [9, 255]
                        password.value.length > 255 ||
                        !(/^[\x00-\x7F]*$/.test(password.value)) ? false : //ascii only

                        /[a-z]/.test(password.value) &&
                        /[A-Z]/.test(password.value) &&
                        /\d/.test(password.value) &&
                        /[!@#$%^&*(),.?":{}|<>_\-\\\/$$  $$;'`~+=]/.test(password.value)
            ),

    //login required fields
            fields = [
                {
                    label: "email",
                    type: "email",
                    model: email,
                    validator: isEmailValid
                },
                {
                    label: "password",
                    type: "password",
                    model: password,
                    validator: isPasswordValid
                }
            ],

    //active, incorrect and correct class switch
            getClasses = (index: number, field: any, suffix: string) => {
                const classes: Record <string, boolean> = {};
                if(activeField.value === index){
                    if(field.validator){
                        if(field.model.value === "")
                            classes [`auth-form-active-${suffix}`] = true;
                        else if(field.validator.value)
                            classes [`auth-form-correct-${suffix}`] = true;
                        else
                            classes [`auth-form-incorrect-${suffix}`] = true;
                    }else
                        classes [`auth-form-active-${suffix}`] = true;
                }
                return classes;
            },

    //login function
            login = async () => {
                try {
                    let status: boolean = fields.some((field, index) => {
                        if (field.model.value === "") {
                            alert(`${field.label} is required`);
                            activeField.value = index;
                            return true;
                        }
                        return false;
                    });
                    if(status)
                        return;
                    if(!isEmailValid.value){
                        alert("invalid email address");
                        activeField.value = 0;
                        return;
                    }
                    if(!isPasswordValid.value){
                        alert(
                            "invalid password\n" +
                            "password must be:\n" +
                            "1. 9-255 chars\n" +
                            "2. ascii only\n" +
                            "3. contain lowercase, uppercase, digit and symbols"
                        );
                        activeField.value = 1;
                        return;
                    }
                    const response = await fetch("http://localhost:3002/api/auth/login", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            email: email.value,
                            password: password.value
                        })
                    });
                    if(response.ok){
                        const data = await response.json();
                        localStorage.setItem("token", data.jwt);
                        alert("login successfully");
                        router.push({ name: "home" });
                    }else
                        alert("login failed");
                }catch(error){
                    alert(`an error occurred:\t${error}`);
                }
            };
</script>

<style lang="less" scoped>
    #auth-form-container {
        top: 35%;
        right: 10%;
    }
</style>