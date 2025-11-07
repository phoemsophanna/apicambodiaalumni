<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Verification Code</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 40px; }
        .card { background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
        h1 { color: #2b7cff; }
        .code { font-size: 32px; font-weight: bold; letter-spacing: 4px; color: #111; margin: 20px 0; }
        p { color: #444; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Hello!</h1>
        <p>Your verification code is:</p>
        <div class="code">{{ $code }}</div>
        <p>This code will expire in <strong>{{ $minutes }} minutes</strong>.</p>
        <p>Thanks,<br>{{ config('app.name') }}</p>
    </div>
</body>
</html>