import { Link } from "react-router-dom";
import "./Login.scss";

export default function Login() {
  return (
    <div className="login-container">
      <div className="login-content">
        <h1>Đăng nhập</h1>
        <input
          type="text"
          placeholder="Số điện thoại"
          className="number-phone"
        />
        <input type="password" placeholder="Mật khẩu" className="password" />
        <button className="btn-login">Đăng nhập</button>
        <div className="content-footer">
          <Link to="/auth/forgot-password">Bạn quên mật khẩu?</Link>
          <Link to="/auth/register">Bạn chưa có tài khoản? Đăng kí</Link>
        </div>
        <div className="text-copyright">
          Bản quyền &copy; {new Date().getFullYear()} RMS - Lại Thế Thành
        </div>
      </div>
    </div>
  );
}
