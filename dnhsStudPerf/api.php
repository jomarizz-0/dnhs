<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

require_once 'db.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

switch ($method) {

    // ─── READ: Get all students (with optional search) ───────────────────────
    case 'GET':
        if ($action === 'get_students') {
            $search = $_GET['search'] ?? '';
            if ($search) {
                $stmt = $pdo->prepare("
                    SELECT s.*, p.first_name AS supervisor_fname, p.last_name AS supervisor_lname
                    FROM student s
                    LEFT JOIN personnel p ON s.personnel_id = p.personnel_id
                    WHERE s.first_name LIKE :s
                       OR s.last_name LIKE :s
                       OR s.middle_name LIKE :s
                       OR s.address_municipality LIKE :s
                    ORDER BY s.last_name, s.first_name
                ");
                $stmt->execute([':s' => "%$search%"]);
            } else {
                $stmt = $pdo->query("
                    SELECT s.*, p.first_name AS supervisor_fname, p.last_name AS supervisor_lname
                    FROM student s
                    LEFT JOIN personnel p ON s.personnel_id = p.personnel_id
                    ORDER BY s.last_name, s.first_name
                ");
            }
            echo json_encode($stmt->fetchAll());
        }

        // Get single student by ID
        elseif ($action === 'get_student') {
            $id = $_GET['id'] ?? null;
            if (!$id) { echo json_encode(['error' => 'No ID provided']); break; }
            $stmt = $pdo->prepare("SELECT * FROM student WHERE student_id = ?");
            $stmt->execute([$id]);
            $student = $stmt->fetch();
            echo json_encode($student ?: ['error' => 'Student not found']);
        }

        // Get all personnel for dropdown
        elseif ($action === 'get_personnel') {
            $stmt = $pdo->query("SELECT personnel_id, first_name, last_name, position_type FROM personnel ORDER BY last_name");
            echo json_encode($stmt->fetchAll());
        }

        break;

    // ─── CREATE: Add new student ──────────────────────────────────────────────
    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);

        // Validation
        $errors = [];
        if (empty(trim($data['first_name'] ?? '')))  $errors[] = "First name is required.";
        if (empty(trim($data['last_name'] ?? '')))   $errors[] = "Last name is required.";
        if (empty($data['birth_date'] ?? ''))         $errors[] = "Birth date is required.";
        if (empty($data['gender'] ?? ''))             $errors[] = "Gender is required.";
        if (!in_array($data['gender'] ?? '', ['M', 'F'])) $errors[] = "Gender must be M or F.";

        if ($errors) {
            http_response_code(422);
            echo json_encode(['errors' => $errors]);
            break;
        }

        $stmt = $pdo->prepare("
            INSERT INTO student
                (personnel_id, first_name, middle_name, last_name, birth_date, gender, address_barangay, address_municipality)
            VALUES
                (:personnel_id, :first_name, :middle_name, :last_name, :birth_date, :gender, :address_barangay, :address_municipality)
        ");

        $stmt->execute([
            ':personnel_id'          => $data['personnel_id'] ?: null,
            ':first_name'            => trim($data['first_name']),
            ':middle_name'           => trim($data['middle_name'] ?? ''),
            ':last_name'             => trim($data['last_name']),
            ':birth_date'            => $data['birth_date'],
            ':gender'                => $data['gender'],
            ':address_barangay'      => trim($data['address_barangay'] ?? ''),
            ':address_municipality'  => trim($data['address_municipality'] ?? ''),
        ]);

        echo json_encode(['success' => true, 'id' => $pdo->lastInsertId(), 'message' => 'Student added successfully.']);
        break;

    // ─── UPDATE: Edit existing student ───────────────────────────────────────
    case 'PUT':
        $data = json_decode(file_get_contents('php://input'), true);
        $id = $data['student_id'] ?? null;

        if (!$id) { echo json_encode(['error' => 'No student ID provided']); break; }

        // Validation
        $errors = [];
        if (empty(trim($data['first_name'] ?? '')))  $errors[] = "First name is required.";
        if (empty(trim($data['last_name'] ?? '')))   $errors[] = "Last name is required.";
        if (empty($data['birth_date'] ?? ''))         $errors[] = "Birth date is required.";
        if (empty($data['gender'] ?? ''))             $errors[] = "Gender is required.";
        if (!in_array($data['gender'] ?? '', ['M', 'F'])) $errors[] = "Gender must be M or F.";

        if ($errors) {
            http_replace_code(422);
            echo json_encode(['errors' => $errors]);
            break;
        }

        $stmt = $pdo->prepare("
            UPDATE student SET
                personnel_id         = :personnel_id,
                first_name           = :first_name,
                middle_name          = :middle_name,
                last_name            = :last_name,
                birth_date           = :birth_date,
                gender               = :gender,
                address_barangay     = :address_barangay,
                address_municipality = :address_municipality
            WHERE student_id = :id
        ");

        $stmt->execute([
            ':personnel_id'          => $data['personnel_id'] ?: null,
            ':first_name'            => trim($data['first_name']),
            ':middle_name'           => trim($data['middle_name'] ?? ''),
            ':last_name'             => trim($data['last_name']),
            ':birth_date'            => $data['birth_date'],
            ':gender'                => $data['gender'],
            ':address_barangay'      => trim($data['address_barangay'] ?? ''),
            ':address_municipality'  => trim($data['address_municipality'] ?? ''),
            ':id'                    => $id,
        ]);

        echo json_encode(['success' => true, 'message' => 'Student updated successfully.']);
        break;

    // ─── DELETE: Remove student ───────────────────────────────────────────────
    case 'DELETE':
        $id = $_GET['id'] ?? null;
        if (!$id) { echo json_encode(['error' => 'No ID provided']); break; }

        $stmt = $pdo->prepare("DELETE FROM student WHERE student_id = ?");
        $stmt->execute([$id]);

        if ($stmt->rowCount()) {
            echo json_encode(['success' => true, 'message' => 'Student deleted successfully.']);
        } else {
            http_response_code(404);
            echo json_encode(['error' => 'Student not found.']);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(['error' => 'Method not allowed']);
}
?>
