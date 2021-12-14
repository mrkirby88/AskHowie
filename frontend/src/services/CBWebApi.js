import axios from 'axios';

export default {

    getKeywords() {
        return axios.get("/keywords");
    },
    
    submitQuery(input) {
        return axios.get(`/search/${input}`);
    }
}