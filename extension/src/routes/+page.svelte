<script lang="ts">
    import { Button } from '$lib/components/ui/button';

    let isHoverModeEnabled = false;


    const handleEnableHoverMode = async () => {
        const [tab] = await chrome.tabs.query({active: true, lastFocusedWindow: true});
        console.log(tab);
        const response = await chrome.tabs.sendMessage(tab.id, {message: "enableHoverMode"});
        console.log(response);
        isHoverModeEnabled = true;
    }
    const  handleDisableHoverMode = async () => {
        const [tab] = await chrome.tabs.query({active: true, lastFocusedWindow: true});
        console.log(tab);
        const response = await chrome.tabs.sendMessage(tab.id, {message: "disableHoverMode"});
        console.log(response);
        isHoverModeEnabled = false;
    }



</script>
<div class="flex flex-col gap-4 p-4 w-[450px]">
<h1 class="text-xl">Welcome to Browser Board</h1>


{#if isHoverModeEnabled}
<Button on:click={handleDisableHoverMode}>Disable Hover Mode</Button>
{:else}
<Button on:click={handleEnableHoverMode}>Enable Hover Mode</Button>
{/if}

</div>