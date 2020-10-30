<template>
    <div id="star">
        <div class="star-container">
            <div class="star-icon" v-for="(s,i) of 5" :key="i">
                <span class="star-color" :style="{width: width(i)}"></span>
                <!-- <span class="star-color"></span> -->
                <img src="/house/icons/star.png">
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        starVal:{
            type: [Number],
            required: true
        }
    },
    methods: {
        //判断有颜色的星星的长度
        width(i) {
            if (this.starVal >= i + 1) { 
                return '.36333rem'
            } else if (i + 1 - this.starVal > 1) {
                return ''
            } else {
                let scale = this.starVal - i;
                let length = 0.36333 * scale + 'rem';
                return length
            }
        }
    },
    created() {
        console.log(this.starVal)
    }
}
</script>
<style scoped>
    #star {
        height: .36333rem;
    }
    .star-container {
        display: flex;
        align-items: center;
    }
    .star-icon {
        position: relative;
        width: .36333rem;
        height: .36333rem;
        margin-right: .2rem;
        background-color: #fff;
    }
    .star-color {
        display: block;
        position: absolute;
        background-color: #FCD259;
        left: 0;
        top: 0;
        height: .36333rem;
    }
    .star-icon>img {
        width: 100%;
        position: absolute;
    }
</style>