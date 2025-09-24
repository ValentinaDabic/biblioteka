<template>
    <div>
        <v-card class="mx-auto my-4" max-width="300" max-height="550">
            <v-img :src="slika" max-height="400" contain></v-img>
        
            <v-card-title class="text-h6 font-weight-bold">{{ naslov }}</v-card-title>
        
            <v-card-subtitle class="text-body-2">{{ autor }}</v-card-subtitle>
            <v-card-subtitle class="text-h6 text-primary" style="display: flex; justify-content: space-between; align-items: center;">
                <span>{{ cijena }}</span>
                <v-icon
                color="primary"
                :class="{ 'elevated-icon': hover }"
                @mouseover="hover = true"
                @mouseleave="hover = false"
                @click="openDialog"
                >
                mdi-cart
                </v-icon>
            </v-card-subtitle>
        </v-card>
  
        <v-dialog v-model="dialog" max-width="450px">
            <v-card>
                <v-card-title :style="{ backgroundColor: '#F4511E', color: 'white' }" >
                    Knjiga je uspješno dodana u vašu korpu! 
                </v-card-title>    
            </v-card>
        </v-dialog>
    </div>
</template>
  
<script>
  export default {
    name: 'BookCardComponent',
    props: {
      naslov: String,
      autor: String,
      cijena: String,
      slika: String
    },
    data() {
      return {
        dialog: false, 
        hover: false    
      };
    },
    methods: {
    openDialog() {
        this.dialog = true;
        setTimeout(() => {
            this.dialog = false;
        }, 2500);
    },
    closeDialog() {
        this.dialog = false;
    }
    }
  };
</script>
  
<style scoped>
  .elevated-icon {
    transform: translateY(-5px);
    transition: transform 0.3s ease-in-out;
  }
</style>
  