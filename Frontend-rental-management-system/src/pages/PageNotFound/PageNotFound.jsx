import { Link } from "react-router-dom";

export default function PageNotFound() {
  return (
    <div>
      sory. this page is not found!
      <Link to="/" replace>
        quay tro lai trang chu
      </Link>
    </div>
  );
}
