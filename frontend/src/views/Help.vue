<template>
  <div>
      <navigation />
      <docs />
  </div>
</template>

<script>
import navigation from '@/components/Navigation.vue';
import docs from '@/components/Docs.vue';
export default {
    name: "help",
    components: {
        navigation,
        docs
    }

}
</script>

<style>

</style>