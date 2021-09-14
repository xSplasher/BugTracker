import axios from 'axios';

const baseURL = 'http://127.0.0.1:8000/api/';

const axiosInstance = axios.create({
	baseURL: baseURL,
	timeout: 5000,
	headers: {
		Authorization: localStorage.getItem('access_token')
			? 'JWT ' + localStorage.getItem('access_token')
			: null,
		'Content-Type': 'application/json',
		accept: 'application/json',
	}, 
});

axiosInstance.interceptors.response.use(
	(response) => {
		return response;
	},
	async function (error) {
		const originalRequest = error.config;

		if (
			error.response.status === 401
		) {
			console.log('401 Status triggered')
		}

		if (
			error.response.status === 401 &&
			originalRequest.url === baseURL + 'token/refresh/'
		) {
			window.location.href = '/login';
			return Promise.reject(error);
		}

		if(error.response.status === 401 && error.response.data['detail']){
			//console.log('yo');
			//console.log(error.response);
			//window.location.href = '/login';
		}

		if (
			error.response.data.code === 'token_not_valid' &&
			error.response.status === 401
		) {
			//console.log('i was here');
			//console.log(localStorage.getItem('access_token'));
			//console.log(localStorage.getItem('refresh_token'));
			

			//localStorage.setItem('refresh_token','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYyNTI3NTcxOCwianRpIjoiY2Y0ZWQ3Yzg3OTgyNDhhYTgzMTI5OWJlNDExZTdjYTYiLCJ1c2VyX2lkIjoyfQ.93FAFn9geOR7yqjkjKYao8PE3Pu3LELWFP8ObQItWMo');
			const refreshToken = localStorage.getItem('refresh_token');

			if (refreshToken !== 'undefined') {
				//console.log('TRYING TO REFRESH TOKEN');
				//console.log(refreshToken)
				const tokenParts = JSON.parse(atob(refreshToken.split('.')[1]));

				// exp date in token is expressed in seconds, while now() returns milliseconds:
				const now = Math.ceil(Date.now() / 1000);
				//console.log(tokenParts.exp);
				if (tokenParts.exp > now) {
					
					return axiosInstance
						.post('/token/refresh/', { refresh: refreshToken })
						.then((response) => {
							//localStorage.clear();
							localStorage.setItem('access_token', response.data.access);
							//localStorage.setItem('refresh_token', response.data.refresh);
							//console.log('was i here ?');
							//console.log(localStorage.getItem('refresh_token'));
							axiosInstance.defaults.headers['Authorization'] =
								'JWT ' + response.data.access;
							originalRequest.headers['Authorization'] =
								'JWT ' + response.data.access;

							return axiosInstance(originalRequest);
						})
						.catch((err) => {
							//console.log(err);
						});
				} else {
					//console.log('Refresh token is expired', tokenParts.exp, now);
					window.location.href = '/login/';
				}
			} else {
				//console.log('Refresh token not available.');
				window.location.href = '/login/';
			}
		}

		// specific error handling done elsewhere
		return Promise.reject(error);
	}
);

export default axiosInstance;