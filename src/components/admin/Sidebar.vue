<script setup>
import { useAuthStore } from '@/stores/auth';
import { ref } from 'vue';

const authStore = useAuthStore();
const { logout } = authStore;

const handleLogout = async () => {
    await logout();
}

const menuItems = ref([
    { name: 'Dashboard', icon: 'home', route: 'admin.dashboard' },
    { name: 'Tiket', icon: 'tag', route: 'admin.ticket' },
]);
</script>

<template>
<aside class="w-72 bg-white/70 backdrop-blur-lg shadow-2xl min-h-screen relative flex flex-col">

    <!-- Logo & Brand -->
    <div class="p-6 border-b border-gray-100 flex flex-col items-center">
        <img src="/logo.png" alt="PDAM Logo" class="w-20 h-20 rounded-full shadow-lg mb-2">
        <h1 class="text-2xl font-extrabold text-blue-900 text-center drop-shadow-lg">PDAM Tirta Kuantan Singingi</h1>
    </div>

    <!-- Menu -->
    <nav class="mt-6 flex-1">
        <ul>
            <li v-for="item in menuItems" :key="item.name">
                <RouterLink :to="{ name: item.route }"
                    class="flex items-center px-6 py-3 text-gray-700 hover:bg-blue-50 hover:text-blue-700 rounded-l-full transition relative"
                    :class="{ 'bg-blue-100 text-blue-700 font-semibold before:absolute before:left-0 before:top-0 before:h-full before:w-1 before:bg-blue-600 before:rounded-tr-lg before:rounded-br-lg': $route.name === item.route }">
                    <i :data-feather="item.icon" class="w-5 h-5 mr-3"></i>
                    {{ item.name }}
                </RouterLink>
            </li>
        </ul>
    </nav>

    <!-- Logout -->
    <div class="p-6 border-t border-gray-100">
        <button @click="handleLogout"
            class="flex items-center w-full px-4 py-3 bg-red-600 text-white rounded-lg hover:bg-red-700 transition shadow-md">
            <i data-feather="log-out" class="w-5 h-5 mr-3"></i>
            Logout
        </button>
    </div>

</aside>
</template>

<style scoped>
/* Hover smooth transition for sidebar items */
nav ul li a {
    transition: all 0.3s ease-in-out;
}
</style>
