<template>
    <div id="expander">
        <!-- 文字区域 -->
        <div class="container" :style="{height:state ? '' : height,minHeight:state ? '' : height}" :class="state ? '' : 'retract'">
            <slot></slot>
        </div>
        <!-- 收起展开符号 -->
        <div class="symbol" @click="changeState" :style="{textAlign:position}">
            <span class="expander-f">{{state ? '收起' : '展开'}}</span>
            <i class="iconfont icon-expander">{{state ? '&#xe606;' : '&#xe607;'}}</i>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        height:{
            type:[String],
            require:true
        },
        position: {
            type: [String],
            require:true
        }
    },
    data () {
        return {
            state: false     //状态：展开与否
        }
    },
    methods: {
        changeState () {
            this.state = !this.state;
        }
    }
}
</script>
<style scoped>
    .container {
        width: 100%;
        margin-bottom: 15px;
        overflow: hidden;
    }
    .retract {
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 5;
    }
    .symbol {
        width: 100%;
        height: 30px;
        line-height: 30px;
        font-size: 14px;
        color: #ff3c83;
        text-align: right;
    }
    .expander-f {
        margin-right: .0555rem;
    }
</style>