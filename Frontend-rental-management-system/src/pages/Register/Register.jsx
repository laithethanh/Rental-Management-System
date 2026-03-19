import { Link } from "react-router-dom";
import "./Register.scss";

export default function Register() {
  return (
    <div className="register-container">
      <div className="register-content">
        <h1>Đăng kí</h1>
        <input type="text" placeholder="Họ và tên" className="fullname" />
        <input
          type="text"
          placeholder="Số điện thoại"
          className="number-phone"
        />
        <input type="password" placeholder="Mật khẩu" className="password" />
        <button className="btn-register">Đăng kí</button>
        <div className="content-footer">
          <Link to="/auth/login">Bạn đã có tài khoản? Đăng nhập</Link>
        </div>
        <div className="text-copyright">
          Bản quyền &copy; {new Date().getFullYear()} RMS - Lại Thế Thành
        </div>
      </div>
    </div>
  );
}
