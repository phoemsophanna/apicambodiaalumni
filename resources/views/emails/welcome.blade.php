<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Camgotech Email</title>
</head>
<body>
<table
    class="body-wrap"
    style="
        font-family: 'Roboto', sans-serif;
        box-sizing: border-box;
        font-size: 14px;
        width: 100%;
        background-color: transparent;
        margin: 0;
      "
>
    <tr
        style="
          font-family: 'Roboto', sans-serif;
          box-sizing: border-box;
          font-size: 14px;
          margin: 0;
        "
    >
        <td
            style="
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
            font-size: 14px;
            vertical-align: top;
            margin: 0;
          "
            valign="top"
        ></td>
        <td
            class="container"
            width="600"
            style="
            font-family: 'Roboto', sans-serif;
            box-sizing: border-box;
            font-size: 14px;
            display: block !important;
            max-width: 600px !important;
            clear: both !important;
            margin: 0 auto;
          "
            valign="top"
        >
            <div
                class="content"
                style="
              font-family: 'Roboto', sans-serif;
              box-sizing: border-box;
              font-size: 14px;
              max-width: 600px;
              display: block;
              margin: 0 auto;
              padding: 20px;
            "
            >
                <table
                    class="main"
                    width="100%"
                    cellpadding="0"
                    cellspacing="0"
                    itemprop="action"
                    itemscope
                    itemtype="http://schema.org/ConfirmAction"
                    style="
                font-family: 'Roboto', sans-serif;
                box-sizing: border-box;
                font-size: 14px;
                border-radius: 3px;
                margin: 0;
                border: none;
              "
                >
                    <tr
                        style="
                  font-family: 'Roboto', sans-serif;
                  font-size: 14px;
                  margin: 0;
                "
                    >
                        <td
                            class="content-wrap"
                            style="
                    font-family: 'Roboto', sans-serif;
                    box-sizing: border-box;
                    color: #495057;
                    font-size: 14px;
                    vertical-align: top;
                    margin: 0;
                    padding: 30px;
                    box-shadow: 0 3px 15px rgba(30, 32, 37, 0.06);
                    border-radius: 7px;
                    background-color: #fff;
                  "
                            valign="top"
                        >
                            <meta
                                itemprop="name"
                                content="Confirm Email"
                                style="
                      font-family: 'Roboto', sans-serif;
                      box-sizing: border-box;
                      font-size: 14px;
                      margin: 0;
                    "
                            />
                            <table
                                width="100%"
                                cellpadding="0"
                                cellspacing="0"
                                style="
                      font-family: 'Roboto', sans-serif;
                      box-sizing: border-box;
                      font-size: 14px;
                      margin: 0;
                    "
                            >
                                <tr
                                    style="
                        font-family: 'Roboto', sans-serif;
                        box-sizing: border-box;
                        font-size: 14px;
                        margin: 0;
                      "
                                >
                                    <td
                                        class="content-block"
                                        style="
                          font-family: 'Roboto', sans-serif;
                          box-sizing: border-box;
                          font-size: 24px;
                          vertical-align: top;
                          margin: 0;
                          padding: 0 0 10px;
                          text-align: center;
                        "
                                        valign="top"
                                    >
                                        <h5
                                            style="
                            font-family: 'Roboto', sans-serif;
                            margin-bottom: 10px;
                            font-weight: 600;
                          "
                                        >
                                            New Contact
                                        </h5>
                                    </td>
                                </tr>
                                <tr
                                    style="
                        font-family: 'Roboto', sans-serif;
                        box-sizing: border-box;
                        font-size: 14px;
                        margin: 0;
                      "
                                >
                                    <td
                                        class="content-block"
                                        style="
                          font-family: 'Roboto', sans-serif;
                          box-sizing: border-box;
                          font-size: 15px;
                          vertical-align: top;
                          margin: 0;
                          padding: 0 0 12px;
                        "
                                        valign="top"
                                    >
                                        <h5
                                            style="
                            font-family: 'Roboto', sans-serif;
                            margin-bottom: 3px;
                          "
                                        >
                                            Dear, Camgotech
                                        </h5>
                                        <p
                                            style="
                            font-family: 'Roboto', sans-serif;
                            margin-bottom: 8px;
                            color: #878a99;
                          "
                                        >
                                            You new contact from:
                                        </p>
                                    </td>
                                </tr>
                                <tr
                                    style="
                        font-family: 'Roboto', sans-serif;
                        box-sizing: border-box;
                        font-size: 14px;
                        margin: 0;
                      "
                                >
                                    <td
                                        class="content-block"
                                        style="
                          font-family: 'Roboto', sans-serif;
                          box-sizing: border-box;
                          font-size: 15px;
                          vertical-align: top;
                          margin: 0;
                          padding: 0 0 18px;
                        "
                                        valign="top"
                                    >
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td style="width: 150px">Sender's Name</td>
                                                <td>:</td>
                                                <th style="text-align: start">
                                                    {{$mailData['name']}}
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="width: 150px">Email</td>
                                                <td>:</td>
                                                <th style="text-align: start">
                                                    {{$mailData['email']}}
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="width: 150px">Phone Number</td>
                                                <td>:</td>
                                                <th style="text-align: start">
                                                    {{$mailData['number']}}
                                                </th>
                                            </tr>
                                            <tr>
                                                <td style="width: 150px">Subject</td>
                                                <td>:</td>
                                                <th style="text-align: start">
                                                    {{$mailData['subject']}}
                                                </th>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr
                                    style="
                        font-family: 'Roboto', sans-serif;
                        box-sizing: border-box;
                        font-size: 14px;
                        margin: 0;
                      "
                                >
                                    <td
                                        class="content-block"
                                        style="
                          font-family: 'Roboto', sans-serif;
                          box-sizing: border-box;
                          font-size: 15px;
                          vertical-align: top;
                          margin: 0;
                          padding: 0 0 12px;
                        "
                                        valign="top"
                                    >
                                        <h6
                                            style="
                            font-family: 'Roboto', sans-serif;
                            font-size: 15px;
                            text-decoration-line: underline;
                            margin-bottom: 15px;
                          "
                                        >
                                            Message:
                                        </h6>
                                        <p
                                            style="
                            font-family: 'Roboto', sans-serif;
                            margin-bottom: 8px;
                            color: #878a99;
                          "
                                        >
                                            {{$mailData['text']}}
                                        </p>
                                    </td>
                                </tr>
                                <tr
                                    style="
                        font-family: 'Roboto', sans-serif;
                        box-sizing: border-box;
                        font-size: 14px;
                        margin: 0;
                      "
                                >
                                    <td
                                        class="content-block"
                                        style="
                          font-family: 'Roboto', sans-serif;
                          box-sizing: border-box;
                          font-size: 15px;
                          vertical-align: top;
                          margin: 0;
                          padding: 0 0 0px;
                        "
                                        valign="top"
                                    >
                                        <h6
                                            style="
                            font-family: 'Roboto', sans-serif;
                            font-size: 14px;
                            margin-bottom: 0px;
                            text-align: start;
                          "
                                        >
                                            Thank you!
                                        </h6>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <div style="text-align: center; margin: 28px auto 0px auto">
                    <p
                        style="
                  font-family: 'Roboto', sans-serif;
                  font-size: 14px;
                  color: #98a6ad;
                  margin: 0px;
                "
                    >
                        2023 Camgotech. Design & Develop by Camgotech
                    </p>
                </div>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
