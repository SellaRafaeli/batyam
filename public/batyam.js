//src: http://www.quora.com/How-is-the-fuzzy-search-algorithm-in-Sublime-Text-designed, http://jsfiddle.net/bulat/CCryL/
function isFuzzyMatch(obj, query) {
    var tokens = query.toLowerCase().split(''),
    matches = [];
    searchSet = [obj];
    searchSet.forEach(function(string) {
        var tokenIndex = 0,
        stringIndex = 0,
        matchWithHighlights = '',
        matchedPositions = [];

        string = obj.value.toLowerCase();

        while (stringIndex < string.length) {
            if (string[stringIndex] === tokens[tokenIndex]) {
                matchWithHighlights += highlight(string[stringIndex]);
                matchedPositions.push(stringIndex);
                tokenIndex++;

                if (tokenIndex >= tokens.length) {
                    matches.push({
                        match: string,
                        highlighted: matchWithHighlights + string.slice(stringIndex + 1),
                        positions: matchedPositions
                    });

                    break;
                }
            }
            else {
                matchWithHighlights += string[stringIndex];
            }

            stringIndex++;
        }
    });

    return matches;
}

function highlight(string) {
    return '<span class="highlight">' + string + '</span>';
}

function submitNewQuery(form) {
    ajaxPost(form.serializeObject(), '/queries/create', function afterQueryCreated(res) {
        form[0].reset();
    });
}



function ajaxPost(data, route, cb) {
 //   $.post(route, function)
}