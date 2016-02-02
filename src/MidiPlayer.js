// module MidiPlayer

module.exports = {
    
    loadPlugin: function(config) {
        return function(callback) {
            return function() {
                window.onload = function() {
                    MIDI.loadPlugin(
                        extend_TODO_eliminate({
		            onprogress: function(state, progress) {
			        console.log('onprogress:', state, progress);
		            },
                            onsuccess: function() {
                                callback()();
                            }
                        }, config
					     ));
                };
            };
        };
    },

    setVolume: function(channel) {
        return function(volume) {
            return function() {
                MIDI.setVolume(channel, volume);
            };
        };
    },

    loadFile: function(dataUrl) {
	return function () {
	    console.log('loadFile: MIDI = ', MIDI);
	    MIDI.Player.loadFile(dataUrl);
	};
    },
    
    play: function() {
	    console.log('play: MIDI = ', MIDI);
	    MIDI.Player.start();
    },

    stop: function() {
	console.log('stop: MIDI = ', MIDI);
	MIDI.Player.stop();
    },

    pause: function() {
	console.log('pause: MIDI = ', MIDI);
	MIDI.Player.pause();
    },
    
    resume: function() {
	console.log('resume: MIDI = ', MIDI);
	MIDI.Player.resume();
    },
    
    currentTime: function() {
	console.log('currentTime: MIDI = ', MIDI);
	MIDI.Player.currentTime();
    },

    endTime: function() {
	console.log('endTime: MIDI = ', MIDI);
	MIDI.Player.endTime();
    },

    playing: function() {
	console.log('playing MIDI = ', MIDI);
	MIDI.Player.playing();
    }
    
};

// TODO eliminate
var extend_TODO_eliminate = function(defaults, options) {
    var extended = {};
    var prop;
    for (prop in defaults) {
        if (Object.prototype.hasOwnProperty.call(defaults, prop)) {
            extended[prop] = defaults[prop];
        }
    }
    for (prop in options) {
        if (Object.prototype.hasOwnProperty.call(options, prop)) {
            extended[prop] = options[prop];
        }
    }
    return extended;
};
