<template>
  <div>
    <navigation />
    <home />
  </div>
</template>

<script>
import navigation from '../components/Navigation.vue';
import home from '@/components/Home.vue';
export default {
  components: { navigation, home },
};
</script>
