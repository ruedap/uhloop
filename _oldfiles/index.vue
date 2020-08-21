<template>
  <section class="container">
    <h1 class="title">
      <a class="logoLink" href="https://github.com/ruedap/uhloop">
        <logo></logo>
      </a>
    </h1>
    <p>This site is temporarily unavailable.</p>
    <a class="repo" href="https://github.com/ruedap/uhloop">ruedap/uhloop</a>
  </section>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo
  }
}
</script>

<style>
.container {
  margin: 0 1rem;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.title {
  display: flex;
  justify-content: center;
  width: 100%;
  margin-bottom: 1.2rem;
}

.logoLink {
  display: flex;
  width: 100%;
  max-width: 330px;
}

.repo {
  display: block;
  margin-top: 0.3rem;
  font-size: 80%;
}
</style>
