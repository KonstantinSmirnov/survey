CKEDITOR.editorConfig = function( config ) {
config.toolbar_basic = [
    [ 'Undo', 'Redo' ],
    [ 'Bold', 'Italic', 'Underline'],
    [ 'TextColor', 'BGColor' ],
    [ 'NumberedList', 'BulletedList' ],
    [ 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    [ 'Link', 'Unlink', 'Blockquote' ]
];
//You may reconfigure toolbar for all sessions
config.toolbar = config.toolbar_basic;
};
