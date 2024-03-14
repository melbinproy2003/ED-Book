var pattern = /(https?:\/\/\S+)/gi;
var textArea = document.getElementById("msg");
var urls = [];
var apiKey = 'AIzaSyBj1ubkZmXWdNRlv3pIqdXCvG8lxjisZSg';


function checkPhishingUrl(url, callback) {
    var safeBrowsingUrl = 'https://safebrowsing.googleapis.com/v4/threatMatches:find?key=' + apiKey;
    var requestBody = {
        client: {
            clientId: 'CollegeConnect',
            clientVersion: '1.5.2'
        },
        threatInfo: {
            threatTypes: ['MALWARE', 'SOCIAL_ENGINEERING', 'UNWANTED_SOFTWARE', 'POTENTIALLY_HARMFUL_APPLICATION'],
            platformTypes: ['ANY_PLATFORM'],
            threatEntryTypes: ['URL'],
            threatEntries: [{url: url}]
        }
    };
    $.ajax({
        url: safeBrowsingUrl,
        type: 'POST',
        data: JSON.stringify(requestBody),
        contentType: 'application/json',
        success: function(result) {
            if (result.matches) {
                callback(true);
            } else {
                callback(false);
            }
        },
        error: function(error) {
            console.log(error);
            callback(false);
        }
    });
}

function checkUrlsForPhishingCallback(urls, callback) {
    var callbacksRemaining = urls.length;
    var results = [];

    function checkPhishingUrlCallback(url, isPhishing) {
        results.push({url: url, isPhishing: isPhishing});
        callbacksRemaining--;

        if (callbacksRemaining == 0) {
            callback(results);
        }
    }

    for (var i = 0; i < urls.length; i++) {
        checkPhishingUrl(urls[i], (function(url) {
            return function(isPhishing) {
                checkPhishingUrlCallback(url, isPhishing);
            };
        })(urls[i]));
    }
}

function extractUrls(text) {
    var urls = [];
    var urlRegex = /(https?:\/\/[^\s]+)/g;
    var matches = text.match(urlRegex);

    if (matches !== null) {
        urls = matches;
    }

    return urls;
}

function sendChat() {
    var msg = textArea.value;
    urls = extractUrls(msg);

    if (urls.length > 0)
    {
        checkUrlsForPhishingCallback(urls, function(results) {

            for (var i = 0; i < results.length; i++) {
                var result = results[i];

                if (result.isPhishing) {
                    msg = msg.replace(result.url, '<span style="color:red">WARNING: Phishing URL found</span>');
                    $.ajax({
                        url: "AjaxPhishing.jsp",
                        type: "POST",
                        data: {url: result.url},
                        success: function(result) {

                        }
                    });
                } else {
                    msg = msg.replace(result.url, '<a href="' + result.url + '" target="_blank">' + result.url + '</a>');
                }
            }

            $.ajax({
                url: "AjaxChat.jsp",
                type: "POST",
                data: {chat: msg},
                success: function(result) {
                    textArea.value = "";
                    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
                    reloadSection();
                }
            });


        });
    }
    else
    {
        $.ajax({
            url: "AjaxChat.jsp",
            type: "POST",
            data: {chat: msg},
            success: function(result) {
                textArea.value = "";
                $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
                reloadSection();
            }
        });


    }


}

reloadSection();

$(document).ready(function() {
    setInterval(function() {
        reloadSection();
    }, 5000);
});

function reloadSection() {
    $("#conversation").load('Load.jsp');
    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
}














   