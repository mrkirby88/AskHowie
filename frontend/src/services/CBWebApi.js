import axios from 'axios';
import store from '@/store/index.js';

const http = axios.create({
    baseURL: "http://localhost:8080",
    headers: {
        Authorization: 'Bearer ' + store.state.token
    }
    });

export default {

    getKeywords() {
        return http.get("/keywords");
    },
    
    submitQuery(input) {
        return http.get(`/search/${input}`);
    }
}