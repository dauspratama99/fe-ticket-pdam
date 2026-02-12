<script setup>
import { onMounted, ref } from 'vue';
import { useTicketStore } from '@/stores/ticket';
import { storeToRefs } from 'pinia';
import { capitalize } from 'lodash'; 
import feather from 'feather-icons';
import { DateTime } from 'luxon';
import { useRoute } from 'vue-router';

const ticketStore = useTicketStore()
const { success, error, loading } = storeToRefs(ticketStore);
const { fetchTicket, createTicketReply } = ticketStore

const route = useRoute()

const ticket = ref({})
const form = ref({
    content: '',
})

const fetchTicketDetail = async () => {
    const response = await fetchTicket(route.params.code)
    ticket.value = response
    form.value.status = response.status
}

const handleSubmit = async () => {
    await createTicketReply(route.params.code, form.value)
    error.value = null
    form.value.content = null
    await fetchTicketDetail()
}

onMounted(async () => {
    await fetchTicketDetail()
    feather.replace()
})
</script>

<template>
<div class="relative min-h-screen bg-gray-50 p-4">

      <!-- Background PDAM -->
    <div class="bg-pdam"></div>
    <div class="bg-pdam-overlay"></div>

    <!-- Floating lights -->
    <div class="floating-light light-1"></div>
    <div class="floating-light light-2"></div>
    <div class="floating-light light-3"></div>

    <!-- Fade-in Wrapper -->
    <div class="opacity-0 translate-y-6 transition-all duration-700 ease-out animate-fade-in">

        <!-- Back Button -->
        <div class="mb-6">
            <RouterLink :to="{ name: 'app.dashboard' }"
                class="inline-flex items-center text-sm text-gray-600 hover:text-gray-800 transition">
                <i data-feather="arrow-left" class="w-4 h-4 mr-2"></i>
                Kembali ke Daftar Tiket
            </RouterLink>
        </div>

        <!-- Ticket Card -->
        <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl border border-white/40 mb-6 p-6">
            <div class="flex items-start justify-between">

                <div class="flex-1">
                    <!-- Logo & Title -->
                    <div class="flex items-center mb-4 space-x-4">
                        <div class="w-12 h-12 rounded-full bg-white/90 shadow flex items-center justify-center">
                            <img src="/logo.png" alt="PDAM Logo" class="w-10 h-10 object-contain">
                        </div>
                        <h1 class="text-2xl md:text-3xl font-extrabold 
                                   bg-gradient-to-r from-blue-600 via-sky-400 to-blue-800 
                                   bg-clip-text text-transparent drop-shadow-md">
                            {{ ticket.title }}
                        </h1>
                    </div>

                    <!-- Status & Meta -->
                    <div class="flex flex-wrap items-center gap-3 mb-3">
                        <span class="px-3 py-1 text-sm font-medium text-blue-700 bg-blue-100 rounded-full">
                            {{ capitalize(ticket.status) }}
                        </span>
                        <span class="px-3 py-1 text-sm font-medium text-red-700 bg-red-100 rounded-full">
                            {{ capitalize(ticket.priority) }}
                        </span>
                        <span class="text-sm text-gray-500">#{{ ticket.code }}</span>
                        <span class="text-sm text-gray-500">
                            Dibuat pada {{ DateTime.fromISO(ticket.created_at).toFormat('dd MMMM yyyy, HH:mm') }}
                        </span>
                    </div>
                </div>

                <button class="px-4 py-2 border border-gray-200 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition">
                    <i data-feather="download" class="w-4 h-4 inline-block mr-2"></i>
                    Lampiran
                </button>

            </div>
        </div>

        <!-- Discussion Thread -->
        <div class="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl border border-white/40">

            <!-- Replies -->
            <div v-for="reply in ticket.ticket_replies" :key="reply.id"
                 class="p-6 border-b border-gray-100 flex items-start space-x-4">
                <img :src="`https://ui-avatars.com/api/?name=${reply.user.name}&background=0D8ABC&color=fff`"
                     alt="User" class="w-10 h-10 rounded-full shadow">
                <div class="flex-1">
                    <div class="flex items-center justify-between">
                        <div>
                            <h4 class="text-sm font-medium text-gray-800">{{ reply.user.name }}</h4>
                            <p class="text-xs text-gray-500">
                                {{ DateTime.fromISO(reply.created_at).toFormat('dd MMMM yyyy, HH:mm') }}
                            </p>
                        </div>
                    </div>
                    <div class="mt-3 text-sm text-gray-800">
                        <p>{{ reply.content }}</p>
                    </div>
                </div>
            </div>

            <!-- Reply Form -->
            <div class="p-6">
                <h4 class="text-sm font-medium text-gray-800 mb-4">Tambah Balasan</h4>
                <form @submit.prevent="handleSubmit" class="space-y-4">
                    <div class="group">
                        <textarea v-model="form.content"
                                  class="w-full px-4 py-3 border border-gray-200 rounded-lg text-sm 
                                         focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
                                  :class="{ 'border-red-500 ring-red-500': error?.content }"
                                  rows="4"
                                  placeholder="Tulis balasan Anda di sini..." minlength="10"></textarea>
                        <p class="mt-1 text-xs text-red-500" v-if="error?.content">
                            {{ error?.content?.join(', ') }}
                        </p>
                    </div>
                    <div class="flex items-center justify-between">
                        <button class="px-4 py-2 border border-gray-200 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition">
                            <i data-feather="paperclip" class="w-4 h-4 inline-block mr-2"></i>
                            Lampiran
                        </button>
                        <button class="px-6 py-2 bg-blue-600 text-white rounded-lg text-sm hover:bg-blue-700 transition">
                            <i data-feather="send" class="w-4 h-4 inline-block mr-2"></i>
                            <span v-if="!loading">
                                Kirim Balasan
                            </span>
                            <span v-else>
                                Loading...
                            </span>
                        </button>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>
</template>

<style>
/* Fade-in animation */
@keyframes fade-in {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
.animate-fade-in {
    animation: fade-in 0.7s ease-out forwards;
}

/* Background utama PDAM */
.bg-pdam {
    position: absolute;
    inset: 0;
    z-index: -1;
    background: linear-gradient(135deg, #3b82f6 0%, #60a5fa 50%, #bfdbfe 100%);
    overflow: hidden;
}

/* Floating Lights ala PDAM */
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

/* Overlay soft putih + blur untuk konten */
.bg-pdam-overlay {
    position: absolute;
    inset: 0;
    background-color: rgba(255, 255, 255, 0.55);
    backdrop-filter: blur(15px);
}

</style>
