import { Link, useNavigate } from "react-router-dom";
import "./Header.scss";
import { useState } from "react";

export default function Header() {
  const [openFilter, setOpenFilter] = useState(false);
  const navigate = useNavigate();
  const handleOpenFilter = () => {
    setOpenFilter(!openFilter);
  };
  const handleRedirectToLoginPage = () => {
    navigate("/auth/login");
  };
  return (
    <>
      {openFilter && (
        <div className="overlay-filter" onClick={handleOpenFilter}>
          <div
            className="filter-container"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="filter-header">
              <span>Bộ lọc</span>
              <i class="bi bi-x" onClick={handleOpenFilter}></i>
            </div>
            <div className="filter-body">body</div>
            <div className="filter-footer">
              <button>Áp dụng</button>
            </div>
          </div>
        </div>
      )}

      <div className="header-container">
        <div className="header-container-content">
          <div className="header-left">
            <Link to="/">
              <img
                className="logo"
                src="logo.png"
                alt="Trang web tìm phòng trọ mạnh nhất Việt Nam"
              />
            </Link>
            <div className="search-by-place">
              <i className="bi bi-geo-alt-fill"></i>
              <span>Tìm theo khu vực</span>
            </div>
            <button className="btn-filter" onClick={handleOpenFilter}>
              <i className="bi bi-funnel"></i>
              <span>Bộ lọc</span>
            </button>
          </div>
          <div className="header-right">
            <div className="login-item">
              <i className="bi bi-box-arrow-in-right"></i>
              <span onClick={handleRedirectToLoginPage}>Đăng nhập</span>
            </div>
            <div className="avatar-icon">
              <i className="bi bi-person-circle"></i>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
