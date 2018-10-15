<template>
<div>
    <h1>Create Chat Room Pages</h1>
    <div v-for="(room, key, index) in rooms" :key="index">
        {{room.title}}
    </div>
</div>
</template>

<script>
export default {
    data: function() {
        return {
            rooms: []
        }
    }    
}
</script>

