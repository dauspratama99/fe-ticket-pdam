<script setup>
import { onMounted } from "vue";

const props = defineProps({
  title: {
    type: String,
    required: true,
  },
});

onMounted(() => {
  document.querySelector(".page-wrapper")?.classList.add("show");
});
</script>

<template>
  <div
    class="relative min-h-screen flex items-center justify-center overflow-hidden"
  >
    <!-- Background Image -->
    <div class="absolute inset-0 bg-image"></div>

    <!-- Soft White Overlay (tidak terlalu blur) -->
    <div class="absolute inset-0 bg-white/55 backdrop-blur-md"></div>

    <!-- Floating Lights -->
    <div class="floating-light light-1"></div>
    <div class="floating-light light-2"></div>
    <div class="floating-light light-3"></div>

    <!-- Content -->
    <div
      class="page-wrapper relative max-w-md w-full px-6 opacity-0 translate-y-6 transition-all duration-1000 ease-out"
    >
      <!-- Logo & Title -->
      <div class="text-center mb-8">
        <div class="flex justify-center mb-4">
        <img 
            src="/logo.png" 
            alt="Logo PDAM"
            class="h-20 md:h-20 object-contain drop-shadow-md opacity-90">
    </div>

        <div class="text-center mb-6">
          <h2
            class="text-5xl md:text-6xl font-extrabold tracking-[0.2em] bg-gradient-to-r from-blue-600 via-sky-400 to-blue-800 bg-clip-text text-transparent drop-shadow-[0_5px_15px_rgba(40,99,235,0.4)]"
          >
            PDAM
          </h2>

          <div class="flex items-center justify-center mt-4 space-x-3">
            <div class="h-[2px] w-12 bg-blue-400/60"></div>

            <h4
              class="text-xl md:text-2xl font-medium text-gray-700 tracking-wide"
            >
              Tirta Kuanta Singingi
            </h4>

            <div class="h-[2px] w-12 bg-blue-400/60"></div>
          </div>
        </div>

        <p class="mt-3 text-sm text-gray-600">
          {{ title }}
        </p>
      </div>

      <!-- Luxury Login Card -->
      <div
        class="bg-white/85 backdrop-blur-md rounded-2xl shadow-[0_20px_60px_rgba(0,0,0,0.15)] border border-white/40 p-10"
      >
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<style>
/* Background */
.bg-image {
  background-image: url("/kuansing.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.logo-wrapper {
  position: relative;
  display: inline-block;
}

.logo-wrapper::before {
  content: "";
  position: absolute;
  inset: -15px;
  border-radius: 50%;
  background: radial-gradient(
    circle,
    rgba(59, 130, 246, 0.4) 0%,
    transparent 70%
  );
  filter: blur(20px);
  z-index: -1;
}

/* Fade In Effect */
.page-wrapper.show {
  opacity: 1 !important;
  transform: translateY(0) !important;
}

/* Floating Light Effect */
.floating-light {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  opacity: 0.4;
  animation: float 12s infinite ease-in-out alternate;
}

.light-1 {
  width: 300px;
  height: 300px;
  background: #60a5fa;
  top: 10%;
  left: 5%;
}

.light-2 {
  width: 250px;
  height: 250px;
  background: #93c5fd;
  bottom: 10%;
  right: 10%;
  animation-delay: 3s;
}

.light-3 {
  width: 200px;
  height: 200px;
  background: #bfdbfe;
  top: 50%;
  right: 30%;
  animation-delay: 6s;
}

@keyframes float {
  from {
    transform: translateY(0px) translateX(0px);
  }
  to {
    transform: translateY(-40px) translateX(30px);
  }
}
</style>
