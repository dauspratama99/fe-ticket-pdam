<script setup>
import { ref } from 'vue';
import { useAuthStore } from '@/stores/auth';
import { storeToRefs } from 'pinia';

const authStore = useAuthStore();
const { user } = storeToRefs(authStore);
const { logout } = authStore;

const showUserMenu = ref(false);

const toggleUserMenu = () => {
    showUserMenu.value = !showUserMenu.value;
}

const handleLogout = async () => {
    await logout();
}
</script>

<template>
<nav class="relative bg-white/90 backdrop-blur-md shadow-lg z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16 items-center">

            <!-- Logo PDAM -->
            <a href="#" class="flex items-center space-x-3">
                <div class="w-12 h-12 rounded-full bg-white/80 shadow-md flex items-center justify-center">
                    <img src="/logo.png" alt="PDAM Logo" class="w-10 h-10 object-contain">
                </div>
                <span class="text-xl font-extrabold bg-gradient-to-r from-blue-600 via-sky-400 to-blue-800
                             bg-clip-text text-transparent drop-shadow-md">
                    PDAM Tirta Kuantan Singingi
                </span>
            </a>

            <!-- Right Menu -->
            <div class="flex items-center space-x-4">

                <!-- Notification -->
                <button class="relative p-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-full transition">
                    <i data-feather="bell" class="w-6 h-6"></i>
                    <span class="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full animate-ping"></span>
                </button>

                <!-- User Menu -->
                <div class="relative">
                    <button @click="toggleUserMenu"
                        class="flex items-center bg-white/80 backdrop-blur-md px-4 py-2 rounded-full hover:shadow-md transition">
                        <img :src="`https://ui-avatars.com/api/?name=${user?.name}&background=0D8ABC&color=fff`"
                             alt="Profile" class="w-8 h-8 rounded-full shadow-sm">
                        <span class="ml-2 text-sm font-medium text-gray-700">{{ user?.name }}</span>
                        <i data-feather="chevron-down" class="w-4 h-4 ml-2 text-gray-500"></i>
                    </button>

                    <!-- Dropdown -->
                    <transition name="fade">
                        <div v-if="showUserMenu"
                             class="absolute right-0 mt-2 w-48 bg-white/90 backdrop-blur-md rounded-xl shadow-xl border border-gray-100 py-2 z-50">
                            <a href="#"
                               class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-700 transition">
                               Profil
                            </a>
                            <a href="#"
                               class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-700 transition">
                               Pengaturan
                            </a>
                            <div class="border-t border-gray-100 my-1"></div>
                            <button @click="handleLogout"
                                    class="w-full text-left px-4 py-2 text-sm text-red-600 hover:bg-red-50 hover:text-red-700 transition">
                                Keluar
                            </button>
                        </div>
                    </transition>
                </div>

            </div>
        </div>
    </div>
</nav>
</template>

<style>
/* Fade dropdown */
.fade-enter-active, .fade-leave-active {
  transition: all 0.2s ease;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
.fade-enter-to, .fade-leave-from {
  opacity: 1;
  transform: translateY(0);
}

/* Ping animation for notification */
@keyframes ping {
  0% { transform: scale(1); opacity: 1; }
  75%, 100% { transform: scale(2); opacity: 0; }
}
.animate-ping {
  animation: ping 1.5s cubic-bezier(0, 0, 0.2, 1) infinite;
}
</style>
