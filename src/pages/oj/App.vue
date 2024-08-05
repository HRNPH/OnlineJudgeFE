<template>
  <div>
    <NavBar></NavBar>
    <div class="content-app">
      <transition name="fadeInUp" mode="out-in">
        <router-view></router-view>
      </transition>
      <footer class="footer">
        <div class="footer-content">
          <p class="text-center text-muted">
            Thanks for coding!
          </p>
          <h3>Powered by <a href="https://www.devcommu.org">Devcommu Grader</a></h3>
          <p>
            A fork of <a href="https://github.com/QingdaoU/OnlineJudge">OnlineJudge</a>
            <span v-if="version"> | Version: {{ version }}</span>
          </p>
          <div class="social-media">
            <!-- Todo A Social Logo -->
            <!-- <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f">facebook</i></a> -->
            <!-- <a href="#" aria-label="Twitter"><i class="fab fa-twitter">twitter</i></a> -->
             <!-- <a href="#" aria-label="GitHub"><i class="fab fa-github"></i>youtube</a> -->
          </div>
        </div>
      </footer>
    </div>
    <BackTop></BackTop>
  </div>
</template>


<script>
import { mapActions, mapState } from 'vuex'
import NavBar from '@oj/components/NavBar.vue'

export default {
  name: 'app',
  components: {
    NavBar
  },
  data() {
    return {
      version: process.env.VERSION
    }
  },
  created() {
    try {
      document.body.removeChild(document.getElementById('app-loader'))
    } catch (e) {
    }
  },
  mounted() {
    this.getWebsiteConfig()
  },
  methods: {
    ...mapActions(['getWebsiteConfig', 'changeDomTitle'])
  },
  computed: {
    ...mapState(['website'])
  },
  watch: {
    'website'() {
      this.changeDomTitle()
    },
    '$route'() {
      this.changeDomTitle()
    }
  }
}
</script>

<style lang="less">
@import '../../styles/themes.css';
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

a {
  text-decoration: none;
  background-color: transparent;

  &:active,
  &:hover {
    outline-width: 0;
  }
}

@media screen and (max-width: 1200px) {
  .content-app {
    margin-top: 160px;
    padding: 0 2%;
  }
}

@media screen and (min-width: 1200px) {
  .content-app {
    margin-top: 80px;
    padding: 0 2%;
  }
}

.footer {
  margin-top: 20px;
  padding: 20px 0;
  background-color: #f7f7f7;
  color: #333;
  text-align: center;
  font-size: small;

  .footer-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;

    p,
    h3 {
      font-family: 'Noto Sans Thai', sans-serif;
    }

    h3 a {
      color: var(--color-primary);
    }

    p a {
      color: var(--color-primary);
      font-weight: bold;
    }

    .social-media {
      margin-top: 15px;

      a {
        margin: 0 10px;
        color: #333;
        font-size: 1.2em;
        transition: color 0.3s;

        &:hover {
          color: #e74c3c;
        }
      }
    }
  }
}

.fadeInUp-enter-active {
  animation: fadeInUp .8s;
}
</style>
