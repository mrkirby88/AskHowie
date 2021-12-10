import axios from 'axios';

const http = axios.create({
    baseURL: "https://localhost:8080",
    });

export default {

    getKeywords() {
        return http.get("/");
    }
    
}