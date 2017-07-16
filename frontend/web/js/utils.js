UTILS = {
    humanReadableFileSizeFormat: (size) => {
        size = parseInt(size);

        if(size < 1024) return size + ' B';
        let sizes = ['kb','Mb','Gb','Tb','Pb','Eb', 'Zb', 'Yb'],
            i = parseInt(Math.floor(Math.log(size) / Math.log(1024)));
        return (size / Math.pow(1024, i)).toFixed(2) + ' ' + sizes[i];
    }
};