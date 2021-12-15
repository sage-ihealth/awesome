local pipelineiOS(branch, instance) = {
    kind: 'pipeline',
    type: 'exec',
    name: 'iOS',
    clone: {
        'disable': true
    },
    steps: [
        {
            name: "fastlane-iOS",
            commands: [
                //'export HOME=/Users/sagegu; cd /Users/sagegu/Documents/GitHub/sage/ShareCareMobile; source ~/.bash_profile; export PATH=/bin:$PATH; echo $PATH',
                'export HOME=/Users/iHealth; cd /Users/iHealth/Documents/GitHub/ShareCareMobile-iOS;',
                'echo $PATH; source ~/.profile; export PATH=/bin:$PATH; echo $PATH',
                'nvm use v14.15.4',
                'which node; node -v',
                'pwd',
                'git fetch origin +refs/heads/master; git checkout master; git fetch origin refs/pull/${DRONE_PULL_REQUEST}/head; git merge ${DRONE_COMMIT_SHA}',
                //'git pull',
                './scripts/ios.sh test'
            ],
            when: {
                event: ["push", "pull_request"]
            }
        }
    ],
     platform:{
        os: "darwin",
        arch: "amd64",
    },
    node: {
        runner: "mac"
    },
    trigger:{
        branch: branch
    },
    image_pull_secrets: ["dockerconfigjson"]
};

local pipelineAndriod(branch, instance) = {
    kind: 'pipeline',
    type: 'exec',
    name: 'android',
    clone: {
        'disable': true
    },
    steps: [
        {
            name: "fastlane-android",
            commands: [
                'export HOME=/Users/sagegu; cd /Users/sagegu/Documents/GitHub/sage/AwesomeProject;  ',
               // 'export HOME=/Users/iHealth; cd /Users/iHealth/Documents/GitHub/ShareCareMobile-Android;',
                // 'echo $PATH; source ~/.profile; export PATH=/bin:$PATH; echo $PATH',
                // 'nvm use v14.15.4',
                // 'which node; node -v',
                // 'pwd',
                'export LC_ALL=en_US.UTF-8',
                'export LANG=en_US.UTF-8',
                //'git fetch origin +refs/heads/master; git checkout master; git fetch origin refs/pull/${DRONE_PULL_REQUEST}/head; git merge ${DRONE_COMMIT_SHA}',
                './scripts/android.sh test'
            ],
            when: {
                event: ["push", "pull_request"]
            }
        }
    ],
     platform:{
        os: "darwin",
        arch: "amd64",
    },
    node: {
        runner: "sage"
    },
    trigger:{
        branch: branch
    },
    image_pull_secrets: ["dockerconfigjson"]
};

local dev_drone = ["https://dev-drone.ihealth-eng.com"];
local test_drone = ["test-drone.ihealth-eng.com"];
local prod_drone = ["prod-drone.ihealth-eng.com"];
[
    //pipelineiOS(branch="master",  instance=dev_drone),
    pipelineAndriod(branch="master",  instance=dev_drone),
]
