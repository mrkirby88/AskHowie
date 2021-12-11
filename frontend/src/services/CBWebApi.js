import axios from 'axios';

const http = axios.create({
    baseURL: "https://localhost:8080",
    });

export default {

    getKeywords() {
        return http.get("/keywords");
    },
    
    submitQuery(keyword) {
        return http.get(`/responses/${keyword}`);
    }
}