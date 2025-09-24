<template>
  <v-app id="inspire">
    <v-app-bar color="#F4511E" dark app>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title class="text-h4 font-weight-bold">BiblioSfera</v-toolbar-title>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      fixed
      temporary
      color="#F4511E"
      dark
    >
    <v-list dense nav>
      <router-link to="/" class="text-decoration-none">
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title class="text-h6 p-2">Početna</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </router-link>

      <router-link to="/shop" class="text-decoration-none">
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-shopping</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title class="text-h6 p-2">Shop</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </router-link>

      <router-link to="/dodajKnjigu" class="text-decoration-none">
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-book-plus</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title class="text-h6 p-2">Dodaj knjigu</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </router-link>
    </v-list>

    </v-navigation-drawer>

    <v-main class="grey lighten-3">
      <v-container>
        <v-row>
          <router-view></router-view>
        </v-row>
      </v-container>
    </v-main>
    <v-footer height="60" color="#F4511E" class="white--text">
      <v-row text-align="center" justify="center">
        <v-col class="text-center" cols="12">
          <span>© 2025 BiblioSfera</span>
        </v-col>
      </v-row>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    data: () => ({ drawer: null }),
  }
</script>