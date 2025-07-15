<template>
    <main id = "greet-container">
        <h1 id = "title">Welcome</h1>
        <h2 id = "greet">
            Please signup or login to use 
            <span class = "names" id = "caesar">Caesar's</span>
            <span class = "names" id = "management">Management</span>
            <span class = "names" id = "system">System</span>
        </h2>
    </main>
</template>

<style lang = "less" scoped>
    @import "src\styles\variables\colors.less";
    #greet-container{
        display: flex;
        flex-direction: column;
        row-gap: 10%;
        justify-content: center;
        align-items: center;
        text-align: center;

        #title{
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: 70px;
            color: @primary;
            font-weight: 900;
            letter-spacing: 1em;
        }

        #greet{
            font-family: Arial, Helvetica, sans-serif;
            font-size: 50px;
            
            .names::before,
            .names::after{
                color: purple;
            }

            .names::before{
                content: "\A✝";
            }

            .names::after{
                content: "✝\A";
            }

            .names{
                font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
                font-size: 70px;
                letter-spacing: 0.1em;
                white-space: pre;
            }

            #caesar{
                color: @normalRed;
            }

            #management{
                color: @normalGreen;
            }

            #system{
                color: @normalBlue;
            }
        }
    }
</style>