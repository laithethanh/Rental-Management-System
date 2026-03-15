# /src/hooks

Chứa các custom hooks để tái sử dụng logic:
- useAuth.js: logic đăng nhập, check token.
- useRooms.js: gọi API/logic quản lý phòng.
- useTenants.js: logic xử lý dữ liệu người thuê.
- useFetch.js: custom hook gọi API chung.

Mục tiêu: tách logic ra khỏi component → UI sạch hơn.