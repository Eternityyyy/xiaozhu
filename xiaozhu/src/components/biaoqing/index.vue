<template>
  <div>
    <biaoqing @contentChange="contentChange" :type="0" width="50%" height="300px" id="biaoqing1" value="😂"/>

  </div>
</template>
<script>
  import biaoqing from './biaoqing.vue'
  export default {
    components:{
      biaoqing
    },
    data() {
      return {
      };
    },

    methods: {
      //文本框失去焦点回调
      contentChange(date){
        console.log(date,'-------------')
      },

    },

    created() {
    },
    mounted() {
    },
  };
</script>
<style lang='less' scoped>

</style>














3
