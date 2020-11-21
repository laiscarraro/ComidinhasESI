class Heart_Animation {
    constructor() {
        this.currentRating = 0;

        this.voidHearts = [
            document.getElementById('void-heart-1'),
            document.getElementById('void-heart-2'),
            document.getElementById('void-heart-3'),
            document.getElementById('void-heart-4'),
            document.getElementById('void-heart-5')
        ];

        this.filledHearts = [
            document.getElementById('filled-heart-1'),
            document.getElementById('filled-heart-2'),
            document.getElementById('filled-heart-3'),
            document.getElementById('filled-heart-4'),
            document.getElementById('filled-heart-5')
        ];

        this.pulsingHearts = [
            null,
            document.getElementById('pulsing-heart-2'),
            document.getElementById('pulsing-heart-3'),
            document.getElementById('pulsing-heart-4'),
            document.getElementById('pulsing-heart-5')
        ];

        this.sparkles = [
            document.getElementById('sparkle-1'),
            document.getElementById('sparkle-2'),
            document.getElementById('sparkle-3')
        ];

        this.fissure = document.getElementById('fissure');

        this.multipleHearts = document.getElementById('multiple-hearts');
    }

    changeRating(newRating) {
        if(newRating > this.currentRating) {
            this.checkForBrokenHeart(newRating);
            this.increaseHearts(newRating);
        }
        else if(newRating < this.currentRating) {
            this.removeSparkles();
            this.checkFor5Hearts(newRating);
            this.decreaseHearts(newRating);
        }
    }

    increaseHearts(newRating) {
        this.currentRating++;
        
        this.filledHearts[this.currentRating-1].animate([
            { transform: 'translateX(-100%) scale(0)' },
            { transform: 'translateX(-100%) scale(1)' }
        ], {
            duration: 150,
            fill: 'forwards'
        }).onfinish = () => {
            if(newRating > this.currentRating)
                this.increaseHearts(newRating);
            else {
                this.checkForBrokenHeart(newRating);
                this.checkForPulsingHeart(newRating);
                this.checkFor5Hearts(newRating);
            }
        };
    }

    decreaseHearts(newRating) {
        this.currentRating--;

        this.filledHearts[this.currentRating].animate([
            { transform: 'translateX(-100%) scale(1)' },
            { transform: 'translateX(-100%) scale(0)' }
        ], {
            duration: 150,
            fill: 'forwards'
        }).onfinish = () => {
            if(newRating < this.currentRating)
                this.decreaseHearts(newRating);
            else {
                this.checkForBrokenHeart(newRating);
                this.checkForPulsingHeart(newRating);
            }
        };        
    }

    checkForBrokenHeart(newRating) {
        if(this.currentRating == 1) {
            var oldColor, newColor, oldOffset, newOffset;
            if(newRating == 1) {
                oldColor = '#FA5B5B';
                newColor = '#D23C3C';
                oldOffset = '54px';
                newOffset = '0px';
            }
            else {
                oldColor = '#D23C3C';
                newColor = '#FA5B5B';
                oldOffset = '0px';
                newOffset = '54px';                
            }


            this.filledHearts[0].animate([
                { fill: oldColor },
                { fill: newColor }
            ], {
                duration: 150,
                fill: 'forwards'
            });

            this.fissure.animate([
                { strokeDashoffset: oldOffset },
                { strokeDashoffset: newOffset }
            ], {
                duration: 150,
                fill: 'forwards'
            })
        }
    }

    checkForPulsingHeart(newRating) {
        if(this.currentRating == newRating && newRating > 1) {
            this.filledHearts[this.currentRating-1].animate([
                { transform: 'translateX(-100%) scale(1)' },
                { transform: 'translateX(-100%) scale(1.2)' }
            ], {
                duration: 200,
                fill: 'forwards'
            }).onfinish = () => {
                this.filledHearts[this.currentRating-1].animate([
                    { transform: 'translateX(-100%) scale(1.2)' },
                    { transform: 'translateX(-100%) scale(1)' }
                ], {
                    duration: 500,
                    fill: 'forwards'
                })

                var color;
                if(this.currentRating == 5) color = 'rgba(250, 135, 135, ';
                else color = 'rgba(250, 91, 91, ';

                this.pulsingHearts[this.currentRating-1].animate([
                    { transform: "translateX(-100%) scale(1.2)", fill: color.concat('0.7)') },
                    { transform: "translateX(-100%) scale(1.5)", fill: color.concat('0)') }
                ], 600);
            };
        }
    }

    checkFor5Hearts(newRating) {
        if(this.currentRating == 5 && newRating == 5) {
            this.filledHearts.forEach(element => {
                element.animate([
                    { fill: '#FA5B5B', filter: 'none' },
                    { fill: '#FA8787', filter: 'drop-shadow(0 0 10px rgba(250, 135, 135, 0.7))' }
                ], {
                    duration: 150,
                    fill: 'forwards'
                });
            });

            this.multipleHearts.animate([
                { transform: "translateX(-100%) scale(0.7)", fill: "rgba(250, 135, 135, 1)" },
                { transform: "translateX(-100%) scale(2.5)", fill: "rgba(250, 135, 135, 0)" }                
            ], 500).onfinish = () => {
                this.addSparkles();
            };
        }
        else if (this.currentRating == 5) {
            this.filledHearts.forEach(element => {
                element.animate([
                    { fill: '#FA8787', filter: 'drop-shadow(0 0 10px rgba(250, 135, 135, 0.7))' },
                    { fill: '#FA5B5B', filter: 'none' }
                ], {
                    duration: 150,
                    fill: 'forwards'
                });
            });
        }
    }

    addSparkles() {
        this.sparkles[0].classList.add('sparkle-1');
        this.sparkles[1].classList.add('sparkle-2');
        this.sparkles[2].classList.add('sparkle-3');
    }

    removeSparkles() {
        this.sparkles[0].classList.remove('sparkle-1');
        this.sparkles[1].classList.remove('sparkle-2');
        this.sparkles[2].classList.remove('sparkle-3');
    }
}

const heartAnimation = new Heart_Animation();

document.getElementsByName("rate_value").forEach(element => {
    element.addEventListener('change', e => {
        heartAnimation.changeRating(parseInt(e.target.value));
    });
});