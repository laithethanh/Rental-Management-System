import { useNavigate } from "react-router-dom";
import "./ForgotPassword.scss";

export default function ForgotPassword() {
    const navigate = useNavigate()
    const handleRedirectToUpdatePass = () =>{
        navigate("/auth/update-password")
    }
  return (
    <div className="forgot-password-container">
      <div className="forgot-content">
        <h1>Khôi phục mật khẩu</h1>
        <div className="text-info">Nhập Email của bạn để nhận mã đặt lại mật khẩu</div>
        <input type="email" placeholder="Email" />
        <button onClick={handleRedirectToUpdatePass}>
          Tiếp tục <i class="bi bi-arrow-right-short"></i>
        </button>
      </div>
    </div>
  );
}
