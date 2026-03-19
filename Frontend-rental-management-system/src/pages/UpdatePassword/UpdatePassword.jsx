import "./UpdatePassword.scss";

export default function UpdatePassword() {
  return (
    <div className="update-password-container">
      <div className="update-content">
        <h1>Cập nhật mật khẩu mới</h1>
        <div className="text-info">Nhập mật khẩu mới</div>
        <input type="password" />
        <div className="text-info second">Nhập lại mật khẩu mới</div>
        <input type="password" />
        <button>
          Hoàn tất <i class="bi bi-check2"></i>
        </button>
      </div>
    </div>
  );
}
